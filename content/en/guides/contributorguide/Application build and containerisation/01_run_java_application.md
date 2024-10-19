---
title: "Running java application locally"
linkTitle: "Running java application locally"
weight: 3
description: >
  Steps required to run application in your system
---


# Steps for running java application in your local machine

## **Before Starting (Running Linux Virtual Environment)**
This use case involves running a java application locally on a Linux virtual environment hosted on a Windows 11 laptop.

## **Tools needed:**

- [Java17](https://www.oracle.com/java/technologies/downloads/#jdk23-windows)

- [Java Apache Maven](https://maven.apache.org/download.cgi)

- [VS Code](https://code.visualstudio.com/download)

- Linux Environment ([Ubuntu](https://learn.microsoft.com/en-us/windows/wsl/install))

## **Sample Application**

Let’s clone the sample application that we’ll be using in this module to our local development machine. Run the following commands in a windows Command Prompt to clone the [repository](https://github.com/spring-projects/spring-petclinic).

Note: The sample application used in this tutorial is Spring Pet Clinic application and can be exchanged with any other java application
```
cd /path/to/working_directory
git clone https://github.com/spring-projects/spring-petclinic.git
cd spring-petclinic
./mvnw package
java -jar target/*.jar
```
## **Java and Maven version**

This is the Java and Java Maven used for this tutorial:
```
<DEVICE_NAME>:/$ mvn -version
```
![Maven Version](/Maven_Version.png)

```
<Device_Name>:/$ java -version
```
![Java Version](/Java_Version.png)

## **Steps to run application locally**

  **1. Mount the relevant application folder, so it lies on the command line, as shown below**

   ```
   <DEVICE_NAME>:/mnt<address of application folder>$
   ```
  
  "/mnt" - command used to attach file systems onto Linux

  Then attach the address of the sample application stored

  e.g.

  ```
  arvind@DESKTOP-1DEUAEO:/mnt/c/Users/arvin/Desktop/spring-petclinic$
  ```

  This is where the sample application (Spring Pet Clinic) is stored in "c/Users/arvind/Desktop"

\
**2. Run the application**

Using the Command:
```
<DEVICE_NAME>:/mnt/.../working folder/spring-petclinic$ mvn spring-boot:run
```



This allows Maven to trigger the execution of compile, test and package phases automatically, and the application is started.

It will take some time to run application for first time. 


![Application_Running](/Spring_Pet_Clinic.png)
Now your application will start to run.

\
**3. To find the IP address of the Ubuntu Virtual Environment hosting the application**
```
<DEVICE_NAME>:/$ hostname -l
```
e.g. xxx.xx.xx.xx

\
**4.	Then type “http://<IP Address>:8080” into a browser in your Windows.  The screen below should appear**

![Web-page](/Spring_Pet_Clinic_Result.png)

## **Errors**

Error you can get while running the application.

### *Error 1*

You will get something like this which says execution failed and list some java files

![incompatiblity](/Incompatability_Error.png)

In this case, open your application in Visual Studio Code:

**1. Select the relevant folder for the application:**
Do this by pressing CRTL + K and then CRTL + O 

![Select Project](/Selecting_File.png)

**2. Then select the relevant files that has the error**

\
**3.	To change the format of the line break, find the CRLF icon in the bottom right corner:**

![Finding CRLF](/Selecting_CRLF.png)

Then select LF, this is because Linux uses LF as the new line character format

  
![Choosing new line character](/ChangingLF.png)


### *Error 2*

Another error that may occur is the version of Java installed:

![Version Error](/Version_Error.png)

To do this, ensure that the [latest version of Java](https://www.oracle.com/java/technologies/downloads/) is installed 

