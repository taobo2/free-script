FROM centos:7

ARG mode='server'

ENV role=${mode} scripthome='/root'

COPY scripts/ ${scripthome}

RUN yum update -y && chmod +x ${scripthome}/start.sh \
&& for f in ${scripthome}/conf.d.example/*; \
        do cp -n $f ${scripthome}/conf.d/$(basename $f); \
   done \ 
&& chmod +x ${scripthome}/*.sh && ${scripthome}/buildss.sh \
&& [ "${mode}" = 'proxy' ] && ${scripthome}/buildproxy.sh

#ENTRYPOINT ["/root/start.sh"]








    


