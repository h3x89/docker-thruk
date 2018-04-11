#
# Thruk Dockerfile
#
# https://github.com/
#

# Pull base image.
FROM centos:latest



# Update & install packages for thruk

RUN yum update -y


RUN yum install -y \
        wget \
        vim \
        #apache2 \
        httpd \
        libexpat1 \
        libgd3 \
        libmysqlclient18 \
        #libapache2-mod-fcgid \
        cronie \
        nginx-full \
        cron \
        apache2-utils \
        logrotate \
        php \
        php-cli \
        mod_fcgid \
        gd \
        perl-Data-Dumper



RUN	rpm -i http://download.thruk.org/pkg/v2.20/rhel7/x86_64/libthruk-2.20-1.rhel7.x86_64.rpm && \
	rpm -i http://download.thruk.org/pkg/v2.20/rhel7/x86_64/thruk-base-2.20-1.rhel7.x86_64.rpm && \
	rpm -i http://download.thruk.org/pkg/v2.20/rhel7/x86_64/thruk-plugin-reporting-2.20-1.rhel7.x86_64.rpm && \
	rpm -i http://download.thruk.org/pkg/v2.20/rhel7/x86_64/thruk-2.20-1.rhel7.x86_64.rpm


#Configure thruk
ADD thruk_local.conf /etc/thruk/
ADD cgi.cfg /etc/thruk/

ADD apache_fcgid.conf /etc/httpd/conf.modules.d/

EXPOSE 80


# DEBUG
COPY ./entrypoint.sh /
COPY ./httpd.sh /
ENTRYPOINT ["bash"]


# # Start the service
# CMD ["-D", "FOREGROUND"]
# ENTRYPOINT ["/usr/sbin/httpd"]
