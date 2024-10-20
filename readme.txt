
# Build the image
sudo docker build -t personal_rstudio_img:v20241020 -f rstudio.Dockerfile .

# Check the images
sudo docker images

# Inspect the IMAGE ID of rstudio-custom:v20210526
docker inspect personal_rstudio_img:v20241020 --format '{{ .ID }}' | cut -f2- -d:

# Turn it into a container
sudo docker run -d -e PASSWORD=minhasenha -p 8787:8787 -v $(pwd):/home/rstudio/ --name=personal_rstudio_ctn 4fc3047afdf3647ab202f828f456e859d592ed8e523a25b562da015f315c79af

# Check what's up
docker ps