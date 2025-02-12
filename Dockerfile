FROM rocker/rstudio:4.4.2

USER root

WORKDIR /home/rstudio
COPY renv.lock /home/rstudio/renv.lock
COPY renv /home/rstudio/renv

COPY script.R /home/rstudio/script.R


RUN Rscript -e "install.packages('renv', repos = c(CRAN = 'https://cloud.r-project.org'))"
RUN Rscript -e "install.packages('remotes', repos = c(CRAN = 'https://cloud.r-project.org'))"
RUN R -e 'renv::restore(lockfile="renv.lock", confirm=FALSE)'

USER rstudio
