#!/bin/bash

# ---------------------------------Color Definitions----------------------------------
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
CYAN='\033[1;36m'
BWHITE='\033[1;97m'
RESET='\033[0m'


# Ensure student.txt exists
touch student.txt

# -----------------------------------Teacher login------------------------------------

teacher_login()
{

     clear
     # Check for teacher login
     read -p "Enter username: " usrname
     read -sp "Enter password: " usrpswd
     echo ""
  
     
# Already stored the teacher credentials
     if [[ "$usrpswd" != "teacher123" ]];
     then
          echo -e "${RED}Invalid password${RESET}"
          sleep 2
          return
     fi
     
     
# Implement an infinite loop until techer exits it
  while true
  do
       clear
       echo -e "${CYAN}---------------Welcome to Teacher Panel---------------${RESET}"
       echo -e "${YELLOW}1.${RESET} Add student"
       echo -e "${YELLOW}2.${RESET} Delete student"
       echo -e "${YELLOW}3.${RESET} Update student"
       echo -e "${YELLOW}4.${RESET} List of passed students"
       echo -e "${YELLOW}5.${RESET} List of failed students"
       echo -e "${YELLOW}6.${RESET} List of total students"
       echo -e "${YELLOW}7.${RESET} Logout"
       echo -e "${CYAN}------------------------------------------------------${RESET}"
       read -p "Choice: " choice
       
       case "$choice" in
          1) add_student;;
          2) delete_student;;
          3) update_student;;
          4) list_pass;;
          5) list_fail;;
          6) list_total;;
          7) echo -e "${GREEN}Logging out...${RESET}"; sleep 1; return ;;
          *) echo -e "${RED}Invalid option. Please try again.${RESET}"; sleep 2 ;;
       esac
       
  done
  
}



# -----------------------------------Student login------------------------------------

student_login()
{
   clear
   read -p "Enter your roll number: " rollno
   
   if ! grep -q "^$rollno:" student.txt;
   then 
       echo -e "${RED}Your record was not found.${RESET}"
       sleep 2
       return
   fi
   
   
   data=$(grep "^$rollno:" student.txt)
   IFS=":" read -r rollno name marks grade gpa <<< "$data"
   
   
   clear
   echo -e "${CYAN}-------------------Student Record---------------------${RESET}"
   echo -e "${BLUE}Name :${RESET} $name"
   echo -e "${BLUE}Marks:${RESET} $marks"
   echo -e "${BLUE}Grade:${RESET} $grade"
   echo -e "${BLUE}CGPA :${RESET} $gpa"
   echo -e "${CYAN}------------------------------------------------------${RESET}"
   read -p "Press enter to return to main menu..."
   
}




# ------------------------Teacher functionalities upon login--------------------------


# Backup before made any update
backup_file()
{
    cp student.txt student.bak
}


# Add student to the records
add_student()
{
    clear
    # Check for student cout that it don't exceed 20
    total_students=$(wc -l < student.txt) 
    if [[ $total_students -ge 20 ]];
    then
         echo -e "${RED}Student limit (20) reached.${RESET}"
         sleep 2
         return
    fi



    # Check duplication in student records 
    read -p "Enter the roll number: " rollno   
     
    if  grep -q "^$rollno:" student.txt;
    then
        echo -e "${RED}Student with roll number $rollno already exists.${RESET}"
        sleep 2
        return
    fi 
    
    
    
    read -p "Enter name of student: " name
    read -p "Enter marks of student: " marks
    
    
    # Validate numeric input
    if ! [[ "$marks" =~ ^[0-9]+$ ]] || [[ "$marks" -gt 100 ]]; 
    then
        echo -e "${RED}Invalid marks input.${RESET}"
        sleep 2
        return
    fi
    
    
    
    # Calculate grade
    if [[ $marks -lt 50 ]];
    then  
         grade='F'
    elif [[ $marks -ge 50 && $marks -lt 60 ]];
    then
         grade='D'
    elif [[ $marks -ge 60 && $marks -lt 70 ]];
    then
         grade='C'
    elif [[ $marks -ge 70 && $marks -lt 80 ]];
    then
         grade='B'
    elif [[ $marks -ge 80 ]];
    then  
         grade='A'  
    fi
    
    
    #GPA mapping
    case "$grade" in
        A) gpa=4.0;;
        B) gpa=3.0;;
        C) gpa=2.0;;
        D) gpa=1.0;;
        F) gpa=0.0;;
    esac
    

    backup_file
    echo "$rollno:$name:$marks:$grade:$gpa" >> student.txt
    echo -e "${GREEN}Student added successfully.${RESET}"
    sleep 2
    
}



# Delete student from the records
delete_student()
{
    clear
    total_students=$(wc -l < student.txt)
    
    if [[ $total_students -eq 0 ]];
    then
         echo -e "${RED}Student file is empty.${RESET}"
         sleep 2
         return
    fi
    
    
    
    read -p "Enter the roll number you want to delete: " rollno
    
    # Check if roll number not present
    if ! grep -q "^$rollno:" student.txt; 
    then
        echo -e "${RED}Student not found.${RESET}"
        sleep 2
        return
    fi
    
    
    backup_file
    grep -v "^$rollno:" student.txt > temp.txt && mv temp.txt student.txt
    echo -e "${GREEN}Student deleted successfully.${RESET}"
    sleep 2
    

}


# Update student or marks or both in place of eisting one 
update_student()
{
     clear
     if [[ ! -s student.txt ]]; 
     then
        echo -e "${RED}Student file is empty.${RESET}"
        sleep 2
        return
     fi
    
     
     read -p "Enter the roll number you want to update: " rollno
     
     
     if ! grep -q "^$rollno:" student.txt; 
     then
        echo -e "${RED}Student not found.${RESET}"
        sleep 2
        return
     fi
     
     
     # Get information of particular roll number
     data=$(grep "^$rollno:" student.txt)
     IFS=":" read -r rollno name marks grade gpa <<< "$data"
     
     
     
     echo -e "${CYAN}1.${RESET} Update name"
     echo -e "${CYAN}2.${RESET} Update marks"
     read -p "Choice: " choice
     
     
     case "$choice" in
         1)
             read -p "Enter new name: " name;;
        
         2)
             read -p "Enter new marks: " marks
             
             
             if ! [[ "$marks" =~ ^[0-9]+$ ]] || [[ "$marks" -gt 100 ]]; 
             then
                echo -e "${RED}Invalid marks input.${RESET}"
                sleep 2
                return
             fi
             
        
             
             if [[ $marks -lt 50 ]]; 
             then 
                  grade="F"
             elif [[ $marks -lt 60 ]]; 
             then
                  grade="D"
             elif [[ $marks -lt 70 ]];
             then 
                  grade="C"
             elif [[ $marks -lt 80 ]];
             then
                  grade="B"
             else 
                  grade="A"
             fi
             
         
             case "$grade" in
                 A) gpa=4.0;;
                 B) gpa=3.0;;
                 C) gpa=2.0;;
                 D) gpa=1.0;;
                 F) gpa=0.0;;
             esac;;
               
         *)
             echo -e "${RED}Invalid option.${RESET}"
             sleep 2
             return;;
        
     esac
  
  
     # Remove line with given roll number
     backup_file
     grep -v "^$rollno:" student.txt > temp.txt
     echo "$rollno:$name:$marks:$grade:$gpa" >> temp.txt
     mv temp.txt student.txt
     echo -e "${GREEN}Student record updated successfully.${RESET}"
     sleep 2
  
}



# List of pass students
list_pass()
{ 
    clear
    echo -e "${GREEN}+=+=+=+=+=+=+ List of Passed Students +=+=+=+=+=+=+=+=+${RESET}"
    
    passed_students=$(grep -E ':(A|B|C|D):' student.txt)
    
    if [[ -z "$passed_students" ]]; 
    then
        echo -e "${YELLOW}No passed students found.${RESET}"
    else
        count=0
        echo -e "${BLUE}Roll No | Name          | Marks | Grade | GPA${RESET}"
        echo -e "${CYAN}----------------------------------------------${RESET}"
        
        while IFS=":" read -r roll name marks grade gpa; 
        do
        
            if [[ "$grade" != "F" ]]; 
            then
                printf "${YELLOW}%-8s ${RESET}| %-13s | %-5s | %-5s | %-4s\n" "$roll" "$name" "$marks" "$grade" "$gpa"
                ((count++))
            fi
            
        done <<< "$passed_students"
    
        echo -e "${CYAN}----------------------------------------------${RESET}"
        echo -e "${GREEN}Total Passed Students: $count${RESET}"
        
        
    fi
    
    echo -e "${GREEN}+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+${RESET}"
    read -p "Press enter to continue..."
          
    
}



# List of fail students
list_fail()
{
    clear
    echo -e "${RED}+=+=+=+=+=+=+ List of Failed Students +=+=+=+=+=+=+=+=+${RESET}"
    
    failed_students=$(grep ':F:' student.txt)
    
    if [[ -z "$failed_students" ]];
    then
        echo -e "${YELLOW}No failed students found.${RESET}"
    else
        count=0
        echo -e "${BLUE}Roll No | Name          | Marks | Grade | GPA${RESET}"
        echo -e "${CYAN}----------------------------------------------${RESET}"
        
        while IFS=":" read -r roll name marks grade gpa; 
        do
            if [[ "$grade" == "F" ]]; 
            then
                printf "${RED}%-8s ${RESET}| %-13s | %-5s | %-5s | %-4s\n" "$roll" "$name" "$marks" "$grade" "$gpa"
                ((count++))
            fi
            
        done <<< "$failed_students"
        
        echo -e "${CYAN}----------------------------------------------${RESET}"
        echo -e "${RED}Total Failed Students: $count${RESET}"
        
    fi
    
    
    echo -e "${RED}+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+${RESET}"
    read -p "Press enter to continue..."
   
    
}



# All students' records
list_total()
{
    echo -e "${BLUE}+=+=+=+=+=+=+=+=+  List of Students +=+=+=+=+=+=+=+=+=+${RESET}"
    echo -e "${CYAN}1.${RESET} Ascending order"
    echo -e "${CYAN}2.${RESET} Descending order"
    read -p "Choice: " option
    
    
    case "$option" in
        1) 
            echo "Students in ascending CGPA order:"
            sorted=$(sort -t ':' -k5g student.txt) ;;
        2)  
            echo "Students in descending CGPA order:"
            sorted=$(sort -t ':' -k5gr student.txt) ;;
            
        *)  
            echo -e "${RED}Invalid option.${RESET}"; sleep 2; return ;;
    esac
    
    
    
    if [[ -z "$sorted" ]];
    then
        echo -e "${RED}No student records found.${RESET}"
    else
        count=0
        echo -e "${BLUE}Roll No | Name          | Marks | Grade | GPA${RESET}"
        echo -e "${CYAN}----------------------------------------------${RESET}"
        
        while IFS=":" read -r roll name marks grade gpa;
         do
            printf "${BWHITE}%-8s ${RESET}| %-13s | %-5s | %-5s | %-4s\n" "$roll" "$name" "$marks" "$grade" "$gpa"
            ((count++))
            
        done <<< "$sorted"
        
        echo -e "${CYAN}----------------------------------------------${RESET}"
        echo -e "${CYAN}Total Students: $count${RESET}"
    fi
    
   
    read -p "Press enter to continue..." 
        
     
} 


