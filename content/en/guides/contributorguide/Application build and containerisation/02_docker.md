---
title: "Running react application in docker"
linkTitle: "Running react application in docker"
weight: 3
description: >
  Steps required to run application using docker
---


### containerize react application

**Before Starting** 

 - I have wsl2 installed in my system and I am using my Linux environment to run this application. I also advised developers to use Linux environment as we will be going to use lot of command line stuff later.

**Software needed :**  
Node js   
npm    
VS Code   
Linux in WSL2  

**Fixing one error** 

In the previous step, we run our application normally. Now its time to build its docker image. But after making image and running application, it is showing ENOENT error. So write this line in this file - `node_modules\react-dev-utils\openBrowser.js` at line 90.

    if (browser === undefined) {
    return  false; 
    }


**Dockerfile**

In the root of the folder create a file named as Dockerfile and copy the below content in it.
```
FROM  node:14-alpine  AS  development
ENV  NODE_ENV  development
WORKDIR  /app
COPY  package.json  .
COPY  yarn.lock  .
RUN  yarn  install
COPY  .  .
EXPOSE  3000
CMD  [  "yarn",  "start"  ]
  ```  

**Build an image**

Now run this command in the terminal :
```
docker build -t client .
```
This will create a docker image of the application.

Now run the following command to run the container :
```
docker run -it -p 3000:3000 client
```
It will take some time and this will be showing in your terminal, and your application is started now.
Now go to `localhost:3000` and check your application running from inside a container.
![react Tab](/react_app.png)

