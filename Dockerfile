FROM centos:7

ARG mode_arg='server'

ENV mode=${mode_arg} scripthome='/root'

COPY scripts/ ${scripthome}

RUN yum update -y && chmod +x ${scripthome}/start.sh \
&& chmod +x ${scripthome}/*.sh && ${scripthome}/buildss.sh \
&& [ "${mode}" = 'proxy' ] && ${scripthome}/buildproxy.sh

#ENTRYPOINT ["/root/start.sh"]








    


