FROM ubuntu:latest

MAINTAINER jeroen@jeroenvd.nl

RUN apt-get update
RUN rm -rf /etc/apt/apt.conf.d/docker-gzip-indexes && apt-get update && apt-get -y install apt-show-versions
#RUN apt-get -y install apt-show-versions && apt-get update && apt-get install -f


# Ubuntu default image for some reason does not have tools like Wget/Tar/etc so lets add them
#RUN apt-get update
RUN apt-get -y install wget git

RUN wget -O- https://raw.github.com/Eugeny/ajenti/master/scripts/install-ubuntu.sh | sudo sh

RUN git clone https://github.com/appdesign1987/scripts.git
RUN cd /scripts && chmod a+x *

EXPOSE 22 21 80 8000 3306 443 25 993 110

#Start app                                                                                                                                                                                                  
ENTRYPOINT ["/scripts/StartAjenti.sh"]
