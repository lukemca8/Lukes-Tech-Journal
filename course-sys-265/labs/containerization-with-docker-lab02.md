# Containerization with Docker (Lab02)

## Docker Basics

Docker is a containerization service used to deploy applications in isolated environments.&#x20;

### Dockerfile

A docker file is a text file that has the instructions to build a docker image. Each instruction in the dockerfile adds a new layer to the image, which creates a final image with the entire application stack. Dockerfiles are a standard, reproducible, and customizable package that defines the build process for docker images.

### Images

Images are used in containers. Docker images are the building blocks of containers. An image contains application code, runtime environment, dependencies, config files, and metadata (image name, tags, labels), which is built from a docker file.

### Containers

Containers are used to package and run applications alongside their dependencies. Containers are isolated environments that have everything needed to run an application. Code, runtime, system libraries, and dependencies are stored within containers. Running a docker container essentially executes an image.&#x20;

### Docker Compose

Docker compose is a tool used for defining and managing multi-container Docker applications. Docker compose uses a docker-compose.yml file which contains the services, networks, and volumes required for an application. When you run `docker-compose up`, docker-compose automatically builds images for services with a build config specified in the docker-compose.yml file. It then starts containers based on these images. This lets you define and manage an entire application stack.

### Docker Hub

Docker Hub is a cloud-based registry service that has docker images. It lets users store, share, and manage docker images. Docker Hub also has official images for popular software.

### Docker Commands

Input: `docker version`

Output:

<figure><img src="../../.gitbook/assets/image (35).png" alt=""><figcaption><p><code>docker version</code> output</p></figcaption></figure>

Docker version outputs all of the current Docker engine version info.

Input: `docker info`

Output:&#x20;



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

