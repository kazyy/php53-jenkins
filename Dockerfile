FROM centos:6
RUN yum install -y epel-release
RUN rpm -U --force http://rpms.famillecollet.com/enterprise/remi-release-6.rpm

# PHP関連
RUN yum install -y php
RUN yum install -y php-pecl-xdebug
RUN yum install -y php-xml
RUN yum install -y php-devel
RUN yum install -y php-pear-XML-Serializer
RUN yum install -y php-password-compat
RUN yum install -y php-symfony
RUN yum install -y php-phpunit-PHPUnit
RUN yum install -y php-phpunit-phpcpd
RUN yum install -y php-pear-PHP-CodeSniffer
RUN yum install -y php-phpmd-PHP-PMD
RUN yum install -y php-pear-phing

# jenkins構築
RUN yum install -y java-1.8.0-openjdk-devel
RUN curl -o /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
RUN rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key
RUN yum install -y jenkins
RUN chkconfig jenkins on


ENTRYPOINT service jenkins start && /bin/bash
