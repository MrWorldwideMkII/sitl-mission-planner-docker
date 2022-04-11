This project builds and runs docker containers that contain ArduPilot SITL and Mission Planner, allowing to easily run them on any computer.

# Prerequisites
1. Linux PC (Ubuntu 20.04 recommended)
1. [Docker](https://docs.docker.com/engine/install/ubuntu/)
1. [Docker non-root](https://docs.docker.com/engine/install/linux-postinstall/)
1. [docker-compose](https://docs.docker.com/compose/install/)

# Usage
1. First we have to build the images:
    1. Run the following command:
    ```sh
    docker-compose -f .docker-compose.root.yml -f compose/dev_environment.docker-compose.yml build \
    && docker-compose -f .docker-compose.root.yml -f compose/drones/dev.docker-compose.sitl.yml build
    ```
    2. Get yourself a cup of `tea`, `coffee` or a `quad long shot grande frappuchino in a venti cup half calf double cupped no sleeve salted caramel mocha latte with 2 pumps of vanilla substitute 2 pumps of white chocolate mocha for mocha and substitute 2 pumps of hazelnut for toffee nut half whole milk and half breve with no whipped cream extra hot extra foam extra caramel drizzle extra salt add a scoop of vanilla bean powder with light ice well stirred` , or take a nap, whatever works for you.
1. Run `run_simulation.sh`
1. To connect mission planner to SITL:
    - Use TCP connection
    - Keep the baudrate at default (115200)
    - "ip" is "sitl" (docker-compose takes care of resolving `sitl` the ip of the container).
    - "port" is 5762