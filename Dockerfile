FROM centos:7

ARG mode='server'

ENV role=${mode} projecthome='/root'

COPY scripts/ ${projecthome}

RUN yum update -y && chmod +x ${projecthome}/start.sh \
&& for f in ${projecthome}/conf.d.example/*; \
        do cp -n $f ${projecthome}/conf.d/$(basename $f); \
   done \ 
&& chmod +x ${projecthome}/*.sh && ${projecthome}/buildss.sh \
&& [ "${mode}" = 'proxy' ] && ${projecthome}/buildproxy.sh

ENTRYPOINT ["/root/start.sh"]








    


