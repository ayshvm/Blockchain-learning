# Celestia Docker

## Install Docker Compose on Ubuntu

To install Docker Compose on Ubuntu, follow these steps:

1. First, ensure that Docker is installed on your system. If not, you can follow the official Docker installation guide for Ubuntu: [Install Docker Engine on Ubuntu](https://docs.docker.com/engine/install/ubuntu/).

2. Once Docker is installed, you can install Docker Compose using `curl`:

    ```bash
    sudo curl -L "https://github.com/docker/compose/releases/download/<VERSION>/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    ```

    Replace `<VERSION>` with the desired Docker Compose version. You can find the latest release version on the [Docker Compose GitHub Releases page](https://github.com/docker/compose/releases).

3. After downloading the Docker Compose binary, apply executable permissions to it:

    ```bash
    sudo chmod +x /usr/local/bin/docker-compose
    ```

4. Verify the installation by checking the Docker Compose version:

    ```bash
    docker-compose --version
    ```

    This command should output the installed Docker Compose version.

## Run Docker Compose

To run Docker Compose, navigate to the directory containing your `docker-compose.yml` file and execute the following command:

```bash
docker-compose up -d

docker ps -a
docker logs -f celestia_celestia_1 
```
