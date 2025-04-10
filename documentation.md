DOCUMENTATION ON HOW TO RUN TIMEOFF MANAGEMENT APP LOCALLY

Yo can run this app in multiple ways, in this document i will show you each way.

1. Run the app

To run this app you will need two things, node and sqlite.

If you dont have node you will have to install it wether directly from the internet or via nvm. Version of node that is required is 13, so if you use node version manager you will run in terminal 
    'nvm install 13'
 and then 
    'nvm use 13'. 

To install sqlite go on the internet and download it. When you download it dont forget to add it to your path, to check if its in your path you can run 
    'sqlite3 --version' 
in your terminaland it will give you version of sqlite.

After the instalation you will go inside the root directory and run 
    'npm install' 
followed by 
    'npm run' 
and this will now run you app which you can check on port
    'localhost:3000'.

# 2. via Docker

To run this file via docker you will need docker engine, go install docker and then return to the root directory.
Inside the root directory there is a file named Dockerfile. To run this app we first need to build docker image. Run in the terminal command 
    'docker build -t  <-name of the image->:<-tag-> <path/to/dockerfile/>',
 for example 
    'docker build -t timeoffmanagement:v1 .' 
(if the dockerfile is in the same directory where you are in the terminal you can put dot (.) instead of path to that directory. But if you were inside /home/timeoff/ and the Dockerfile is inside /home/timeoff/docker/Dockerfile you would have to run something like 'docker build -t timeoff:v1 /docker/Dockerfile'

After build the image you can simply run this image with 
    'docker run -p 3000:3000 -d <image-name>'
witf our image you can run
    'docker run -p 3000:3000 -d timeoffmanagement:v1'
and this will run the app on port 3000 in detachment mode (-d). Detachment mode is to run the app in the background while you can still use the terminal. command -p specifiys where to bind the port, from which port to which port, because our dockerfile is exposed on port 3000 we need to put 3000 as our first port, the second port is where we eant to run it on our machine, it can be any port, if you put 3000:3000 it will run on localhost:3000, and if you put 3000:4040 it will run the app on port localhost:4040.

3. via docker compose

To run file via docker compose you can simply run command
    'docker compose up'
and it will build the image and run the app autmatically and you can go check the app on 'localhost:3000'.


