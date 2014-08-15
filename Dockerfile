FROM ubuntu:14.04

ADD GPG-key.txt .

#varnish v3
RUN apt-key add GPG-key.txt && echo "deb http://repo.varnish-cache.org/ubuntu/ precise varnish-3.0" | sudo tee -a /etc/apt/sources.list && apt-get update && apt-get install -y varnish

#varnish v4
#RUN apt-get update && apt-get install -y apt-transport-https && apt-key add GPG-key.txt && echo "deb https://repo.varnish-cache.org/ubuntu/ trusty varnish-4.0" >> /etc/apt/sources.list.d/varnish-cache.list && apt-get update && apt-get install -y varnish

ADD startup.sh /startup.sh

CMD ["bash", "./startup.sh"]
