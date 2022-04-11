This project builds and runs docker containers that contain ArduPilot SITL and Mission Planner, allowing to easily run them on any computer.

# Prerequisites
1. Linux PC (Ubuntu 20.04 recommended)
1. [Docker](https://docs.docker.com/engine/install/ubuntu/)
1. [Docker non-root](https://docs.docker.com/engine/install/linux-postinstall/)
1. [docker-compose](https://docs.docker.com/compose/install/)

# Usage
1. Build the images
    ```sh
    docker-compose -f .docker-compose.root.yml -f compose/dev_environment.docker-compose.yml build \
    && docker-compose -f .docker-compose.root.yml -f compose/drones/dev.docker-compose.sitl.yml build
    ```
1. Run `run_simulation.sh`
1. To connect missin planner to SITL:
    - Use TCP connection
    - Keep the baudrate at default (115200)
    - "ip" is "sitl" (docker-compose takes care of resolving `sitl` the ip of the container).
    - "port" is 5762