FROM centos
MAINTAINER Julian Vega
#USER root
RUN sed -i -e "s|mirrorlist=|#mirrorlist=|g" /etc/yum.repos.d/CentOS-*
RUN sed -i -e "s|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g" /etc/yum.repos.d/CentOS-*
RUN dnf clean all
RUN dnf swap centos-linux-repos centos-stream-repos -y
RUN yum update -y
RUN yum install vsftpd -y
#RUN echo "<h1> Bienvenidos a esta pagina </h1>" > /var/www/html/index.html
#COPY voldocker/ /var/www/html/
#RUN chmod -R 777 /var/www/html
COPY vusers.txt /etc/vsftpd/
RUN db_load -T -t hash -f /etc/vsftpd/vusers.txt /etc/vsftpd/vsftpd-virtual-user.db; rm -v /etc/vsftpd/vusers.txt; \ 
	chmod 600 /etc/vsftpd/vsftpd-virtual-user.db
COPY vsftpd.conf /etc/vsftpd/
COPY vsftpd.virtual /etc/pam.d/
RUN mkdir -p /home/vftp/ftpuser; chown -R ftp:ftp /home/vftp

EXPOSE 20 21

CMD ["/usr/sbin/vsftpd","-obackground=NO"]
