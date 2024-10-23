#!/bin/bash

sudo docker build -t personal_rstudio_img:v20241020 -f /home/guilhermeviegas1993/personal_rstudio/rstudio.Dockerfile .
img_id=$(sudo docker inspect personal_rstudio_img:v20241020 --format '{{ .ID }}' | cut -f2- -d:)
sudo docker-compose -f /home/guilhermeviegas1993/personal_rstudio/docker-compose.yml up -d --build
sudo docker ps
