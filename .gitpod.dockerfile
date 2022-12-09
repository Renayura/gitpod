FROM renayura/ubuntu:latest
MAINTAINER Renayura <renayura@proton.me>

# Git configuration
COPY ["git.sh", "/"]
RUN chmod +x /git.sh && bash /git.sh
