---
title: "Running react application locally"
linkTitle: "Running react application locally"
weight: 3
description: >
   Steps required to run application in your system
---


### Steps for running react application in your local machine

**Before Starting** 

 - I have wsl2 installed in my system and I am using my Linux environment to run this application. I also advised developers to use
  - Linux environment as we will be going to use lot of command line stuff later.
   - You can also run it in eclipse or other code editor for demo purposes.

**Software needed :**  
Node js   
npm    
VS Code  
Linux in WSL2   

**Sample Application** 

Let’s clone the sample application that we’ll be using in this module to our local development machine. Run the following commands in a terminal to clone the repo.
```
 $ cd /path/to/working/directory
 $ git clone https://github.com/ikismail/React-ShoppingCart.git
 $ cd React-ShoppingCart

```
**Running application through windows**

 - In your project directory, run `npm install`. It will install all the
   dependencies from `package.json` file.
 - Now run `npm start`, it will start your application on
   `localhost:3000`
  
   ![react Tab](/react_app.png)


**Running application through linux**

 - Go to your terminal and install node and npm using this command -    
   ``` 
   sudo apt install npm
   ```    
   This command will also install the nodejs.
  - In your project directory, run `npm install`. It will install all the
   dependencies from `package.json` file.
 - Now go to your project directory and run `npm start`. It will start
   your application in `localhost:3000`
![react Tab](/react_app.png)
