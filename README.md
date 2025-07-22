# To-Do List Web Application (Java, JSP, Servlets, JDBC, MySQL)

A classic web-based To-Do List application, built with Java Servlets, JSP, JDBC, and MySQL. This project allows users to add, view, update, and delete tasks with a simple and intuitive interface.

## Features

- Add, edit, and delete tasks
- Mark tasks as completed or pending
- Simple, clean JSP-based user interface
- Persistent task storage using MySQL database
- Organized codebase with MVC principles

## Technologies Used

- **Backend:** Java Servlets, JDBC
- **Frontend:** JSP, HTML, CSS
- **Database:** MySQL
- **Server:** Apache Tomcat

## Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/pranavyedla/todoappjava.git
```

### 2. Database Setup

- Create a MySQL database (e.g., `todoapp`)
- Import the provided `schema.sql` (or create a table with suitable columns for tasks)

Example:
```sql
CREATE DATABASE todoapp;
USE todoapp;

CREATE TABLE tasks (
    id INT PRIMARY KEY AUTO_INCREMENT,
    description VARCHAR(255) NOT NULL,
    is_done BOOLEAN DEFAULT FALSE
);
```

- Update your database connection details in the project (usually in a properties file or directly in Java code).

### 3. Build & Deploy

- Package the project as a WAR file or copy the project folder to your Tomcat `webapps` directory.
- Start/restart your Apache Tomcat server.
- Visit [http://localhost:8080/TodoAppFull](http://localhost:8080/TodoAppFull) (or your configured app path).

### 4. Usage

- Access the web interface
- Add, edit, or delete your tasks
- Tasks will be saved persistently in your MySQL database

## Folder Structure

- `/src` - Java source code (servlets, DAO, models)
- `/web` or `/WebContent` - JSP files, CSS, and static assets
