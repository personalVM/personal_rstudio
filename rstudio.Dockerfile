FROM rocker/geospatial

LABEL mantainer=guilhermeviegas1993@gmail.com

# system dependencies
RUN apt-get update && apt-get install -y \
    sudo \
    pandoc \
    pandoc-citeproc \
    libcurl4-gnutls-dev \
    libcairo2-dev \
    libxt-dev \
    libssl-dev \
    libssh2-1-dev \
    xorg-dev \
    libxml2-dev \
    libmpfr-dev \
    libsasl2-dev \
    libudunits2-dev \
    libgdal-dev

VOLUME /home/rstudio/

# basic R packages
# RUN R -e "install.packages(c('shiny', 'rmarkdown'), repos='https://cloud.r-project.org/')" # main libs
# RUN R -e "install.packages(c('XML', 'devtools', 'bit64', 'xtable'))" # dev libs
# RUN R -e "install.packages(c('readr', 'rio'))" # load libs
# RUN R -e "install.packages(c('dplyr', 'plyr', 'janitor'))" # Treatment libs
# RUN R -e "install.packages(c('ggplot2'))" # viz libs

# additional R packages
# RUN R -e "install.packages('tidyverse')"
# RUN R -e "install.packages('mongolite')"
# RUN R -e "install.packages('reticulate')"
# RUN R -e "install.packages('shinydashboard')"
# RUN R -e "install.packages('shinyWidgets')"
# RUN R -e "install.packages('shinyjs')"
# RUN R -e "install.packages('shinycssloaders')"
# RUN R -e "install.packages('DT')"
# RUN R -e "install.packages('sparklyr')"

# spatial R packages
# RUN R -e "install.packages('sp')"
# RUN R -e "install.packages('spdep')"
# RUN R -e "install.packages('leaflet')"

# EXPOSE 8787

# ENV ROOT=true
# ENV USER=rstudio
# ENV PASSWORD=rstudio

# USER root

# CMD ["rstudio-server"]


