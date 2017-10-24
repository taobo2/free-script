FROM centos:7

COPY config.json start.sh buildss.sh /root/

RUN yum update -y && chmod +x /root/start.sh && chmod +x /root/buildss.sh && /root/buildss.sh

#ENTRYPOINT ["/root/start.sh"]








    


