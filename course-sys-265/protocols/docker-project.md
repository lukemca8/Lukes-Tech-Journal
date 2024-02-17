# Docker - Project

I used docker and docker-compose to build a web application with node.js as the backend and MongoDB as the database.



## Directory:&#x20;

<figure><img src="../../.gitbook/assets/image (1).png" alt=""><figcaption><p>project directory</p></figcaption></figure>

### Docker-compose.yml:&#x20;

<figure><img src="../../.gitbook/assets/image (1) (1).png" alt=""><figcaption><p>docker-sompose.yml file </p></figcaption></figure>

The Docker-compose.yml file specifies the services required for the final product and their configurations. While the web service image is built locally from the Dockerfile, the MongoDB image is pulled from the Docker Hub registry.

The configuration in the file specifies to expose port 3000 on the web container for external access to the website.  It also says to expose port 27017 on the database container for communication with the web container.

Once this file is run, the build process begins.

### Dockerfile:&#x20;

<figure><img src="../../.gitbook/assets/image (2).png" alt=""><figcaption><p>Dockerfile file</p></figcaption></figure>

This file builds the web application image.

### Index.js:&#x20;

<figure><img src="../../.gitbook/assets/image (3).png" alt=""><figcaption><p>index.js file</p></figcaption></figure>

This file defines how the web server will run.

I used [chat-gpt](https://chat.openai.com/) for help when building the files. I used the [docker hub registry](https://hub.docker.com/\_/mongo) for the MongoDB image.

## `sudo docker-compose up --build`

After creating the project directory and files: `sudo docker-compose up --build` while still under the project directory.&#x20;

This command starts the building process for the docker images specified in the docker-compose.yml file and the containers to go along with them. Docker-node-mongo\_web is the web application and mongo is the database for the web application.

<figure><img src="../../.gitbook/assets/image.png" alt=""><figcaption><p>docker proccess</p></figcaption></figure>

Dockerfile is used to build the docker-node-mongo\_web image. Once the image is built, the container is built from it, and it is configured to run the node.js web server as defined in the index.js file.&#x20;

The Mongo image for the database was created using a pre-built docker image pulled from the docker hub registry. After the image was pulled, a container was created from the image.&#x20;



To browse to the web server: "http://docker01-luke:3000"

The web page:

<figure><img src="../../.gitbook/assets/image (4).png" alt=""><figcaption><p>web page</p></figcaption></figure>

