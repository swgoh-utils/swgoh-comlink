## Installation Instructions for Raspberry Pi OS 64-bit

This folder contains an example `docker-compose.yml` file along with some sample shell scripts to be used for first time
setup of docker package repositories, docker installation, and first time environment configuration for hosting both
swgoh-comlink and stat-calc containers. Some adjustments may be required for individual environment specifics, but these
should provide a solid foundation to use as templates.

### Basic Usage
After cloning this repository or downloading this folder contents:

1. Modify the `docker-compose.yml` file to the specifics for your intended use.
2. Execute the shell scripts (make sure the shell scripts are executable first, `sudo chmod +x *.sh`)
3. Launch the containers using the `docker compose up` command

```bash
1_setup_docker_apt_repo.sh
2_install_docker_pkgs.sh
3_setup_docker_env.sh

docker compose up
```
If all goes well, the result should be both the `swgoh-comlink` and `stat-calc` containers running.