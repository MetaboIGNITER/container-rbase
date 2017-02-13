FROM ubuntu:16.04

MAINTAINER PhenoMeNal-H2020 Project ( phenomenal-h2020-users@googlegroups.com )

LABEL Description="R base container for susequent containers of R packages."
LABEL software.version="3.3.2"
LABEL version="0.1"



# Add cran R backport
RUN apt-get -y update
RUN apt-get -y install apt-transport-https
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9
RUN echo "deb https://mirrors.ebi.ac.uk/CRAN/bin/linux/ubuntu xenial/" >> /etc/apt/sources.list

# Update and upgrade sources
RUN apt-get -y update
RUN apt-get -y dist-upgrade

# Install RStudio-related packages
RUN apt-get -y --no-install-recommends install r-base

# Clean up
RUN apt-get -y clean && apt-get -y autoremove && rm -rf /var/lib/{cache,log}/ /tmp/* /var/tmp/*

# Define Entry point
#ENTRYPOINT ["/usr/bin/Rscript"]

