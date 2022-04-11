# Instructions 
1. Build the environments
    ```sh
    docker-compose -f .docker-compose.root.yml -f compose/dev_environment.docker-compose.yml build && \
    docker-compose -f .docker-compose.root.yml -f compose/drones/dev.docker-compose.sitl.yml build
    ```
1. Run `run_simulation.sh`. It assumes you have docker-compose installed, and built the `dev_env`. 
1. To connect:
    - Use the TCP protocol
    - Keep the baudrate at default
    - The "IP" is "sitl" (since we use docker-compose, there is a name resolution and the name is as given in the docker compose to the service)
    - The "port" is 5762 (as written in the docker compose)