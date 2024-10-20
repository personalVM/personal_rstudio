sudo docker build -t personal_rstudio_img:v20241020 -f rstudio.Dockerfile .
# sudo docker images
sudo docker inspect personal_rstudio_img:v20241020 --format '{{ .ID }}' | cut -f2- -d:
personal_rstudio_img_id=$(sudo docker inspect personal_rstudio_img:v20241020 --format '{{ .ID }}' | cut -f2- -d:)
sudo docker run -d -e PASSWORD=minhasenha -p 8787:8787 -v $(pwd)/volume/:/home/rstudio/volume --name=personal_rstudio_ctn4 $personal_rstudio_img_id
docker ps


