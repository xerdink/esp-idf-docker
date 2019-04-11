## Docker image for ESP development. :fire: :space_invader:

### Install from Docker Hub  

`$ docker pull orhaneee/espdev`

### Build Dockerfile locally  
Building from Dockerfile may take up to 50 minutes depending on your Internet connection!  

`$ docker build -t xyz/xyz:0.0.1 .`

### Make a ESP project
Example LED blink project. -v for sharing projects between host and client.  

`$ docker run -t -i -u esp -v /home/orhan/esp/esp-idf/examples/get-started/blink/:/home/esp/esp-dev-folder orhaneee/espdev make all`
