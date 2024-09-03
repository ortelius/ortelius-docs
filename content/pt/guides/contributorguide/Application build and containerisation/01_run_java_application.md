---
title: "Running java application locally"
linkTitle: "Running java application locally"
weight: 3
description: >
  Steps required to run application in your system
---


## Steps for running java application in your local machine

**Before Starting**

- I have wsl2 installed in my system and I am using my Linux environment to run this application. I also advised developers to use
- Linux environment as we will be going to use lot of command line stuff later.
- You can also run it in eclipse or other code editor for demo purposes.

**Software needed :**  
Java
Maven  
VS Code  
Linux in WSL2

**Sample Application**

Let’s clone the sample application that we’ll be using in this module to our local development machine. Run the following commands in a terminal to clone the repo.
```
 cd /path/to/working/directory
 git clone https://github.com/spring-projects/spring-petclinic.git
 cd spring-petclinic

```
**Java and Maven version**

Its the version of maven and java I am using.

![java Tab](/java_maven_version.png)

**Steps to run application locally**

1. Go to your directory where your application lies in command line. Like its my working directory.

   ```arvind@DESKTOP-1DEUAEO:/mnt/c/Users/arvin/Desktop/spring-petclinic$```

2. Run the application using ``
mvnw spring-boot:run
`` command or ``
mvn spring-boot:run
`` command.
It will takes some time to run application for first time. When I run this first time in my machine, it took almost 16 mins, so wait for a while.

![java Tab](/application_started.png)

**Note :** If while running this command ``mvnw spring-boot:run`` if it is showing error, you have to install mvnw using this command ``mvn -N wrapper:wrapper`` and then try to run the prvious command again.
In wsl2, mvnw is still not working sometimes due to windows issue, then run this -

    sudo apt install dos2unix
    dos2unix mvnw

Now your mvnw will works properly.


3. When you get this in your terminal, it means your application is started now. Now visit your `http://localhost:8080`.
4. It will look something like this in your browser.

![java Tab](/spring_ui.png)

**Errors**

Error you can get while running the application.

You will get something like this which says execution failed and list some java files.
![java Tab](/maven_error.png)

In this case, just open your application in vs code and convert it from CRLF to LF which you can find in the right bottom of the vscode.
