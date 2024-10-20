FROM rocker/geospatial

EXPOSE 8787

ENV ROOT=true
ENV USER=rstudio
ENV PASSWORD=rstudio

USER root

CMD ["rstudio-server"]


