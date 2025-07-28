## 🧠 Student Management System (Bash Project)

Welcome to my **first developmental project** in **Bash scripting**, created as part of my journey to refine my **Linux fundamentals** and strengthen my **shell scripting** skills. This project follows **modular programming** by separating the authentication and core logic into individual Bash files.

---

### 📂 Project Structure

```bash
.
├── authenticate_system.sh       # Contains all login logic and teacher/student operations
├── student_management_system.sh # Entry-point script to launch the application
├── student.txt                  # Stores student data in colon-separated format
├── student.bak                  # Backup of student data
```

---

### 🔧 Features

#### 👨‍🏫 Teacher Panel

* Secure login with password authentication.
* Add a student (limited to 20 entries).
* Update student name or marks.
* Delete a student record.
* View:

  * Passed students
  * Failed students
  * All students (sorted by GPA ascending/descending)

#### 👨‍🎓 Student Panel

* Enter roll number to view:

  * Name
  * Marks
  * Grade
  * CGPA

---

### 🧱 Concepts Demonstrated

* **Modular Programming in Bash** using `source` to import functionality.
* **Text file manipulation** using tools like `grep`, `sort`, `wc`, and redirection.
* **Data validation** and user input handling.
* **Backup mechanism** before critical changes.
* **Use of ANSI escape codes** for colorized, user-friendly CLI interface.
* **Looping structures**, **functions**, and **case-switch logic** in shell scripting.

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

3. **Teacher credentials:**

   * **Username:** *(any)*
   * **Password:** `teacher123`

---

### 📌 Note

* This system stores records in `student.txt` in the format:

  ```
  RollNo:Name:Marks:Grade:GPA
  ```

* No external dependencies required. Just Bash and standard Linux CLI tools.

---

### 📚 Lessons Learned

* Modularizing code improves readability and reusability.
* Carefully validating inputs prevents errors in simple systems.
* Bash can be used to create interactive CLI applications efficiently.

---

### 📈 Future Enhancements

* Store hashed passwords for teachers using tools like `sha256sum`.
* Implement student login authentication using credentials.
* Add file encryption or database storage for better security.
* Add export functionality (CSV/PDF).

---

### 💬 Feedback

As this is my **first step** in development and DevSecOps journey, feedback and suggestions are welcome!
