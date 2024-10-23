#!/bin/bash

# Arguments with default values
dockerfile=${1:-rstudio.Dockerfile}  # First argument: Dockerfile (default: rstudio.Dockerfile)
img_tag=${2:-personal_rstudio_img:v20241020}  # Second argument: Image tag (default: personal_rstudio_img:v20241020)
container_name=${3:-personal_rstudio_ctn4}  # Third argument: Container name (default: personal_rstudio_ctn4)
password=${4:-minhasenha}  # Fourth argument: RStudio password (default: minhasenha)
port=${5:-8787}  # Fifth argument: Port (default: 8787)
volume_dir=${6:-$(pwd)/}  # Sixth argument: Volume directory (default: current directory/volume)

# Step 1: Build the Docker image
sudo docker build -t "$img_tag" -f "$dockerfile" .

# Step 2: Get the image ID of the newly built image
img_id=$(sudo docker inspect "$img_tag" --format '{{ .ID }}' | cut -f2- -d:)

# Step 3: Run a Docker container with the specified image
sudo docker run -d -e PASSWORD="$password" -p "$port":8787 -v "$volume_dir":/home/rstudio/volume --name="$container_name" "$img_id"

# Step 4: List running containers
docker ps




--
sudo docker build -t personal_rstudio_img:v20241020 -f /home/guilhermeviegas1993/personal_rstudio/rstudio.Dockerfile .

# Step 2: Get the image ID of the newly built image
img_id=$(sudo docker inspect personal_rstudio_img:v20241020 --format '{{ .ID }}' | cut -f2- -d:)

# Step 3: Run a Docker container with the specified image
sudo docker run -d -e PASSWORD="$password" -p 8787:8787 -v /home/guilhermeviegas1993/:/home/rstudio/ --name=personal_rstudio_ctn "$img_id"
sudo docker run -d -e PASSWORD=minhasenha -p 8787:8787 -v $(pwd)/:/home/rstudio/ --name=personal_rstudio_ctn "$img_id"

# Step 4: List running containers
sudo docker ps
