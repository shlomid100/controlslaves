FROM ubuntu:22.04

RUN apt-get update && apt-get install -y openssh-server apache2 python3 sudo && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 22 80

CMD ["/start.sh"]
