# Java Programming Fundamentals & OOP Assignments

This repository contains three Java programming assignments that demonstrate fundamental concepts of object-oriented programming (OOP), such as encapsulation, inheritance, polymorphism, and abstraction. Each assignment includes a detailed description of the problem, implementation, and expected outputs.

---

## Assignment 1: Simple Banking Application

### Problem Statement
Develop a Java program for a simple banking application that manages customer accounts. The program should:
- Use **basic data types** such as account balance and account number.
- Implement operations like deposit and withdrawal using operators.
- Demonstrate **encapsulation** by creating a `BankAccount` class with:
    - **Properties**: `accountNumber`, `balance`.
    - **Methods**: `deposit(amount)`, `withdraw(amount)`.

### Expected Output
The application will allow users to:
- Deposit money into their account.
- Withdraw money from their account (with balance validation).
- Display the account balance after each operation.

#### Sample Output:

---

## Assignment 2: Vehicle Management System

### Problem Statement
Design a Java program for a vehicle management system with the following structure:
- **Vehicle**: A base class with general properties and methods.
- **Car** and **Bike**: Derived classes inheriting from `Vehicle`.
- **Electric**: An interface to demonstrate multiple inheritance, adding electric functionalities.

### Concepts Demonstrated
- **Inheritance**: `Car` and `Bike` inherit properties and methods from the `Vehicle` class.
- **Polymorphism**: Override methods like `startEngine()` in derived classes.
- **Interface Implementation**: Add electric functionalities for specific vehicles.

### Expected Output
The program will:
- Show polymorphic behavior when calling overridden methods.
- Demonstrate electric-specific features for vehicles supporting electric functionalities.

#### Sample Output:

---

## Assignment 3: Employee Management System

### Problem Statement
Create a Java program for an employee management system with the following structure:
- `Employee`: An abstract class with abstract methods:
    - `calculateSalary()`: Calculates the salary for the employee.
    - `generateReport()`: Generates a detailed report of the employee's details.
- `FulltimeEmployee` and `ParttimeEmployee`: Concrete classes extending `Employee` and implementing the abstract methods.

### Concepts Demonstrated
- **Abstraction**: Use of abstract classes and methods.
- **Concrete Implementation**: Different implementations of salary calculation and report generation for full-time and part-time employees.

### Expected Output
The program will:
- Calculate the salary based on employee type.
- Generate detailed employee reports, showcasing the functionality of the abstract class.

