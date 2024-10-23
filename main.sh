#!/bin/bash

password=${4:-minhasenha}  # Fourth argument: RStudio password (default: minhasenha)

build_datestamp="v20241020" # TODO: dynamic

# Step 1: Build the Docker image
sudo docker build -t personal_rstudio_img:v20241020 -f /home/guilhermeviegas1993/personal_rstudio/rstudio.Dockerfile .

# Step 2: Get the image ID of the newly built image
img_id=$(sudo docker inspect personal_rstudio_img:v20241020 --format '{{ .ID }}' | cut -f2- -d:)

# Step 3: Run a Docker container with the specified image
sudo docker run -d -e PASSWORD="$password" -p 8787:8787 -v /home/guilhermeviegas1993/:/home/rstudio/ --name=personal_rstudio_ctn "$img_id"

# Step 4: List running containers
sudo docker ps
