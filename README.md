# Online Voting System

## Introduction
This is an online voting system project developed in Java. The application allows users to register, log in, and vote for their preferred party.

## Prerequisites
- Java Development Kit (JDK) 8 or higher
- Apache Tomcat 8 or higher
- MySQL Database
- Git

## Setup Instructions

 1. Clone the Repository
First, clone the repository to your local machine using Git.

 2. Set Up the Development Environment
Open the project in your preferred Integrated Development Environment (IDE), such as Eclipse or IntelliJ IDEA.

 3. Configure the Database
Ensure MySQL is installed and running. Create the necessary database and tables using the following SQL statements:

CREATE DATABASE voting_system;

USE voting_system;

CREATE TABLE votertable (
    VoterID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(45),
    AdharNo VARCHAR(45),
    Age INT,
    UserID VARCHAR(45),
    Password VARCHAR(45)
);

CREATE TABLE votetable (
    voterid INT,
    PartyName VARCHAR(45),
    FOREIGN KEY (voterid) REFERENCES votertable(VoterID)
);


4. Update Database Configuration
Update the src/main/java/p1/DbUtil.java file with your database connection details:


5. Build and Run the Project
In your IDE, configure Apache Tomcat.

For Eclipse: Go to Servers view, right-click, and choose New -> Server. Select Apache Tomcat and follow the prompts.
For IntelliJ IDEA: Go to Run -> Edit Configurations. Add a new Tomcat server configuration and set the deployment options.
Deploy the project to the Tomcat server.

For Eclipse: Right-click the project, choose Run As -> Run on Server.
For IntelliJ IDEA: Click the Run button with the Tomcat configuration selected.
Start the server and navigate to the application URL:

http://localhost:8080/OnlineVotingSystem

Usage:
Access the application through your web browser.
Register a new user.
Log in with your credentials.
Cast your vote.




Project Structure
The project structure is as follows:

src/main/java/p1/DbUtil.java: Java class for database utilities.
src/main/webapp/: Directory containing the HTML, JSP files, and other web resources.
WEB-INF/web.xml: Deployment descriptor for the web application.
WEB-INF/lib/: Directory containing the MySQL connector library (mysql-connector-j-8.2.0.jar).




Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.




