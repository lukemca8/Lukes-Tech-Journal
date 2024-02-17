# Containerization with Docker (Lab02)

## Docker Basics

Docker is a containerization service used to deploy applications in isolated environments.&#x20;

### Dockerfile

A docker file is a text file that has the instructions to build a docker image. Each instruction in the dockerfile adds a new layer to the image, which creates a final image with the entire application stack. Dockerfiles are a standard, reproducible, and customizable package that defines the build process for docker images.

### Images

Images are used in containers. Docker images are the building blocks of containers. An image contains application code, runtime environment, dependencies, config files, and metadata (image name, tags, labels), which is built from a docker file.

<figure><img src="https://lh7-us.googleusercontent.com/irOqDN5VzyPQZCj_4DAPJ4FZyFOhmKWwst42reyt3vURmFAUWCJCscVeRgHEq7ET7uhKXKZ6EEipcZOwcvAJyfm-0312xLtThvHTuFGQB3BY9NudMa5VR6xbVlBMWFOF78c5MgOq38kHtwOXkPbbPY4" alt=""><figcaption><p>docker running hello world image</p></figcaption></figure>

### Containers

Containers are used to package and run applications alongside their dependencies. Containers are isolated environments that have everything needed to run an application. Code, runtime, system libraries, and dependencies are stored within containers. Running a docker container essentially executes an image.&#x20;

### Docker Compose

Docker compose is a tool used for defining and managing multi-container Docker applications. Docker compose uses a docker-compose.yml file which contains the services, networks, and volumes required for an application. When you run `docker-compose up`, docker-compose automatically builds images for services with a build config specified in the docker-compose.yml file. It then starts containers based on these images. This lets you define and manage an entire application stack.

<figure><img src="https://lh7-us.googleusercontent.com/_Jmbq9Ha1c18LxDf_IfUOQr18MTCnszn1VL7hw45cu-ORXB-jyRiOf3MbZ-0WJSppGnFSK8gYb8Lw707qbRwvs-GystxBBvYt3tmyx6YcekMUo897bzmkIkZILQBbtekOSC1QQBngp7gNTVWY5Mw408" alt=""><figcaption><p>website created with a docker-compose.yaml file</p></figcaption></figure>

### Docker Hub

Docker Hub is a cloud-based registry service that has docker images. It lets users store, share, and manage docker images. Docker Hub also has official images for popular software.

### Docker Commands

Input: `docker version`

Output:

<figure><img src="../../.gitbook/assets/image (35).png" alt=""><figcaption><p><code>docker version</code> output</p></figcaption></figure>

Input: `docker info`

Output:&#x20;

<figure><img src="../../.gitbook/assets/image.png" alt=""><figcaption><p><code>docker info</code> output</p></figcaption></figure>

Input: `docker ps`&#x20;

Output:&#x20;

<div data-full-width="false">

<figure><img src="../../.gitbook/assets/image (1).png" alt=""><figcaption><p><code>docker ps</code> output</p></figcaption></figure>

</div>

_Used to display the containers_

Input: `docker images`

Output:&#x20;

<figure><img src="../../.gitbook/assets/image (2).png" alt=""><figcaption><p><code>docker images</code> output</p></figcaption></figure>

Input: `docker run hello-world`

Output:&#x20;

<figure><img src="https://lh7-us.googleusercontent.com/irOqDN5VzyPQZCj_4DAPJ4FZyFOhmKWwst42reyt3vURmFAUWCJCscVeRgHEq7ET7uhKXKZ6EEipcZOwcvAJyfm-0312xLtThvHTuFGQB3BY9NudMa5VR6xbVlBMWFOF78c5MgOq38kHtwOXkPbbPY4" alt=""><figcaption><p><code>docker run hello-world</code> output</p></figcaption></figure>

_Docker is pulling the container image “hello-world” from the Docker Hub registry because the hello-world image is not found locally. It then runs the hello world image, which contains the files (in this case text)._

Input: `docker-compose --version`

Output:

<figure><img src="https://lh7-us.googleusercontent.com/Wcy44LdkIv5mNuBkT1xwc3JjG2Q2PdK6-8rXs-kmvi6d7R6N_LcFsZTIJnrsYwZKZWVfQaULKDNHBIBWtggHcgSHYE7Eax9-RgQ5KRAomCo1JNMhaW7zmkF-LjDVJgpuqYtW-iYXmmK3fOzVJV2_8Ps" alt=""><figcaption><p>docker-compose --version</p></figcaption></figure>

Input: `docker run -d -P training/webapp python app.py`

Output:&#x20;

<figure><img src="https://lh7-us.googleusercontent.com/7q7GuLgzKfXW27heDm9a2hNmWRH7Ywks1_Oh1_mOAialkUBVdfZqE_yc_lRoEPe5vpiUgdeixpyc_7fsMXxCo2kVI_BD47GtbCZ-ubmH9EKMBLKg7EZxWObUimCVVV2zFtOOGFfnWk3wmPij99oiMw" alt=""><figcaption><p><code>docker run -d -P training/webapp python app.py</code> output</p></figcaption></figure>

_This runs a docker image, simultaneously creating a container._

_-d is the detached option. This tells Docker to run in the background and not to attach to the terminal. This lets you use the terminal while the container runs in the background._&#x20;

_-P publishes all exposed ports from the container to random ports on the host system. This exposes services running inside the container to the host system, external clients, and other containers on the network. This makes it easy to interact with and test applications inside a Docker container._

Input: `docker-compose up`

Output:&#x20;

<figure><img src="../../.gitbook/assets/image (3).png" alt=""><figcaption><p><code>docker-compose up</code> output</p></figcaption></figure>

_Docker compose starts the services defined in the docker-compose.yml file from the pwd (present working directory) and outputs the logs from all the containers._

## Ubuntu Basic Configuration

In previous labs, I have worked with CentOS7 and Kali Linux distributions. This was my first time using an Ubuntu distribution. So the initial setup was new to me. This included network configuration, setting a hostname, and creating a named sudo user.&#x20;

### Network Configuration

#### netplan config

To edit the network configuration: `sudo nano /etc/netplan/00-installer-config.yaml`

<figure><img src="../../.gitbook/assets/image (34).png" alt=""><figcaption><p>Network Configuration</p></figcaption></figure>

This brings up the config file, imaged above. I edited the config file as shown. After saving and exiting the file, I applied the changes: `sudo netplan apply` &#x20;

#### DNS Records and Hostname

To edit the hostname, edit the hostname file: `sudo nano /etc/hostname` and type in your hostname. Next, edit the hosts file: `sudo nano /etc/hosts` and replace the default hostname with your hostname.

#### Domain Suffix

To edit the domain suffix, edit the resolved configuration file: `sudo nano /etc/systemd/resolved.conf` Uncomment the `Domains` line and type in your domain suffix.

#### Disable Remote Root SSH

To disable remote root ssh, edit the SSH configuration file: `sudo nano /etc/ssh/sshd_config`. Edit the `PermitRootLogin` line from `yes` to `no`. Save and exit the file. Restart the SSH service: `sudo systemctl restart sshd`.

### Named Sudo User

To create a user: `sudo adduser yourusername`. To upgrade the user to the sudo group for more permissions: `sudo usermod -aG sudo yourusername`.

