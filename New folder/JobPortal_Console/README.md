# Job Portal Console Application

## Introduction

This is a console-based Job Portal application developed using Java, Maven, and Oracle JDBC. It allows job seekers to create profiles, search for jobs, and apply for them. Employers can post job listings, search for candidates, and manage applications. Admins can manage users, job listings, and platform content.

## Features

### For Job Seekers
- Create and manage profiles
- Search for jobs based on various criteria
- Apply for jobs
- View and manage applications

### For Employers
- Post and manage job listings
- Search for candidates
- Review and manage applications

### For Admins
- Manage user accounts
- Approve job listings
- Monitor platform activity
- Send notifications

## Technologies Used
- Java
- Maven
- Oracle Database
- JDBC

## Prerequisites

Before you begin, ensure you have the following installed on your machine:

- Java 17 or higher
- Maven
- Oracle Database
- IDE (Eclipse, IntelliJ, etc.)

## Project Structure

job-portal-console-app/
├── src/
│ ├── main/
│ │ ├── java/
│ │ │ ├── com/
│ │ │ │ ├── consoleColors/
│ │ │ │ │ └── ConsoleColors.java
│ │ │ │ ├── jdbcservice/
│ │ │ │ │ └── JdbcConnection.java
│ │ │ │ ├── jobportal/functionality/
│ │ │ │ │ ├── App.java
│ │ │ │ │ ├── Application.java
│ │ │ │ │ ├── ApplicationStatus.java
│ │ │ │ │ ├── Job.java
│ │ │ │ │ ├── JobStatus.java
│ │ │ │ │ └── Search.java
│ │ │ │ ├── messageandnotificationservices/
│ │ │ │ │ └── Message.java
│ │ │ │ ├── userdefinedexception/
│ │ │ │ ├── jobportal/users/
│ │ │ │ └── usersregisterlogin/
│ │ │ │ │ └── UserRegistrationLogin.java
│ ├── resources/
│ │ └── application.properties
├── pom.xml
└── README.md
