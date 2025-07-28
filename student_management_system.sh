#!/bin/bash

# Load the authenticate_system.sh functions
source authenticate_system.sh


# -------------------------------------Color Codes-------------------------------------
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
CYAN='\033[1;36m'
RESET='\033[0m'


main()
{
while true
do
       clear
       echo -e "${CYAN}-------------------------------------------------------${RESET}"
       echo -e "${YELLOW}|${RESET}                                                     ${YELLOW}|${RESET}"
       echo -e "${YELLOW}|${RESET}               ${BOLD}Student Management System${RESET}             ${YELLOW}|${RESET}"
       echo -e "${YELLOW}|${RESET}                                                     ${YELLOW}|${RESET}"
       echo -e "${CYAN}-------------------------------------------------------${RESET}"  
       

        echo -e "${BLUE}1.${RESET} Login as ${GREEN}Teacher${RESET}"
        echo -e "${BLUE}2.${RESET} Login as ${CYAN}Student${RESET}"
        echo -e "${BLUE}3.${RESET} ${RED}Exit${RESET}"
        echo ""
        read -p "Choice: " choice
       
  
      
  
   case "$choice" in
       1) teacher_login;;
       2) student_login;;
       3) 
          echo -e "${GREEN}Exiting the system. Goodbye!${RESET}"; exit 0 ;;
       *) 
          echo -e "${RED}Invalid option. Please try again.${RESET}"
          sleep 2;;
   esac
       
done
}
       
main

