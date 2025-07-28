## 🧠 Student Management System (Bash Project)

Welcome to my **first developmental project** in **Bash scripting**, created as part of my journey to refine my **Linux fundamentals** and strengthen my **shell scripting** skills. This project follows **modular programming** by separating the authentication and core logic into individual Bash files.

---

### 📂 Project Structure

```bash
.
├── authenticate_system.sh         # Contains login logic and teacher/student functions
├── student_management_system.sh   # Entry-point script to run the system
├── student.txt                    # Data storage file
├── student.bak                    # Backup file before each update
```

---

### 🔧 Features

#### 👨‍🏫 Teacher Panel

* Secure login
* Add / Delete / Update student records
* View:

  * Passed Students
  * Failed Students
  * All Students (sorted by GPA)

#### 👨‍🎓 Student Panel

* View your academic record by roll number

---

### 📸 Example Screenshots 

#### 🎓 Main Menu

```
-------------------------------------------------------
|                                                     |
|               Student Management System             |
|                                                     |
-------------------------------------------------------

1. Login as Teacher
2. Login as Student
3. Exit
```

#### 🔐 Teacher Login

```
Enter username: teacher
Enter password: ********

---------------Welcome to Teacher Panel---------------
1. Add student
2. Delete student
3. Update student
4. List of passed students
5. List of failed students
6. List of total students
7. Logout
------------------------------------------------------
Choice:
```

#### 📝 Add Student

```
Enter the roll number: 101
Enter name of student: Alice
Enter marks of student: 82

Student added successfully.
```

#### ✅ Passed Students List

```
+=+=+=+=+=+=+ List of Passed Students +=+=+=+=+=+=+=+=+
Roll No | Name          | Marks | Grade | GPA
----------------------------------------------
101     | Alice         | 82    | A     | 4.0
----------------------------------------------
Total Passed Students: 1
+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+
```

#### ❌ Student Not Found

```
Enter your roll number: 999

Your record was not found.
```

---

### 🧱 Concepts Demonstrated

* Modular Bash scripting (`source` command)
* CLI-based interaction with colors
* File parsing, validation, and sorting
* Function-based logic
* Backup before changes (`cp student.txt student.bak`)

---

### 🚀 How to Run

1. **Make both scripts executable:**

   ```bash
   chmod +x authenticate_system.sh student_management_system.sh
   ```

2. **Run the main script:**

   ```bash
   ./student_management_system.sh
   ```

3. **Teacher password:** `teacher123`

---

### 📌 Notes

* Student records are stored in `student.txt` as:

  ```
  RollNo:Name:Marks:Grade:GPA
  ```

---

### 📚 Lessons Learned

* Importance of modularity in shell scripting
* Practical file handling and pattern matching with tools like `grep`, `sort`, `wc`
* Creating backup and restore logic before destructive changes
* Building CLI systems without external dependencies

---

### 🌱 Future Enhancements

* Store credentials securely using hashing
* Introduce user authentication for students
* Add data export (CSV/Excel)
* Migrate storage to SQLite or JSON for better scaling

---

### 🤝 Feedback

This is my **first developmental Bash project**, and I welcome your feedback to improve and grow as I continue my DevSecOps journey!


