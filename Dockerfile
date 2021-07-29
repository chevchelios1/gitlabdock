FROM ubuntu:latest
LABEL maintainer="artem.loboiko@gmail.com"
RUN apt-get update
ENV TZ=Europe/Kiev
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
COPY gitlab.sh /gitlab.sh
CMD ["bin/bash", "./gitlab.sh"]
RUN ./gitlab.sh
#COPY curl.sh /curl.sh
#CMD ["bin/bash", "./curl.sh"]
#RUN ./curl.sh
##ADD https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | bash
#RUN apt-get install -y openssh-server ca-certificates tzdata perl
#RUN apt-get install -y gitlab-ce
#RUN EXTERNAL_URL="http://3.123.33.30"
EXPOSE 80/tcp
EXPOSE 443/tcp
EXPOSE 22/tcp
