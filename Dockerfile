FROM  centos:latest
LABEL kube.io=foundation
LABEL openshift.io=ex288
MAINTAINER Redhat exam
RUN   yum install httpd python36 -y 
RUN yum clean all
RUN rm -rf /tmp/*
RUN  sed -i "s/Listen 80/Listen 8080/g" /etc/httpd/conf/httpd.conf
COPY  src/  /var/www/html/
RUN chown apache:apache  /var/run/httpd  /var/log/httpd  
RUN chmod  -R 777  /var/run/httpd  /var/log/httpd 
EXPOSE 8080
USER apache
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

