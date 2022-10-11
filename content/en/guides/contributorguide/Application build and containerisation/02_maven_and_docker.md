---
title: "Running java application using docker"
linkTitle: "Running java application using docker"
weight: 3
description: >
  Steps required to run application using docker
---


### Maven build and containerize java application

**Before Starting** 

 - I have wsl2 installed in my system and I am using my Linux environment to run this application. I also advised developers to use Linux environment as we will be going to use lot of command line stuff later.

**Software needed :**  
Java   
Maven  
VS Code  
Linux in WSL2 

**Maven build** 

In the previous step, we run our application normally. Now its time to do the maven build (using mvnw) and then make its docker container and try to run the application from inside of our container.



In the root directory of your project, run this command - `./mvnw -Dmaven.test.skip=true spring-boot:build-image`

**Note :** If while running this command ``./mvnw -Dmaven.test.skip=true spring-boot:build-image `` if it is showing error no such file or directory, its a wsl 2 problem.
In wsl2, mvnw is still not working sometimes due to windows issue, so run this -

    sudo apt install dos2unix
    dos2unix mvnw
    
Now your mvnw will works properly.

This command will create a target folder with a jar file. In this example, the name of jar file will be - 
`spring-petclinic-2.7.0-SNAPSHOT.jar`

**Dockerfile**

In the root of the folder create a file named as Dockerfile and copy the below content in it.
```
FROM  openjdk:8-jdk-alpine
VOLUME  /tmp
COPY  target/*.jar  app.jar
ENTRYPOINT  ["java","-jar","/app.jar"]
  ```  

**Build an image**

Now run this command in the terminal :
```
docker build -t myorg/myapp .
```
This will create a docker image of the application.

Now run the following command to run the container :
```
docker run -p 8080:8080 myorg/myapp
```
It will take some time and this will be showing in your terminal, and your application is started now.
Now go to `localhost:8080` and check your application running from inside a container.

