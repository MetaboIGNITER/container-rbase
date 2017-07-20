FROM ubuntu:16.04

MAINTAINER PhenoMeNal-H2020 Project ( phenomenal-h2020-users@googlegroups.com )

LABEL description="A minimal R base container based on Ubuntu 16.04 for susequent containers of R packages."
LABEL software.version="3.4.1-1xenial0"
LABEL version="0.2"
LABEL base.image="ubuntu:16.04"
LABEL website="https://github.com/phnmnl/container-rbase"
LABEL documentation="https://github.com/phnmnl/container-rbase"
LABEL license="https://github.com/phnmnl/container-rbase/blob/develop/License.txt"
LABEL tags="Statistics"

ENV software_version="3.4.1-1xenial0"

# Add cran R backport
RUN echo "deb http://cloud.r-project.org/bin/linux/ubuntu xenial/" >> /etc/apt/sources.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9

# Install r-base
RUN apt-get -y update && apt-get -y --no-install-recommends install apt-transport-https r-base=${software_version} && \ 
    apt-get -y clean && apt-get -y autoremove && rm -rf /var/lib/{cache,log}/ /tmp/* /var/tmp/*

# Add test script
ADD runTest1.R /usr/local/bin/runTest1.R
 
# Define Entry point
#ENTRYPOINT ["R"]

