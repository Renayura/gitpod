FROM renayura/ubuntu:latest
MAINTAINER Renayura <renayura@proton.me>

# install packages
COPY ["install_packages.sh", "/"]
RUN chmod +x /install_packages.sh && bash /install_packages.sh
