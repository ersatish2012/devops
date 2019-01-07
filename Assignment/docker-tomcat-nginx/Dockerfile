FROM tomcat:8.0-jre8

RUN mv /usr/local/tomcat/conf/tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml.backup
RUN mv /usr/local/tomcat/conf/server.xml /usr/local/tomcat/conf/server.xml.backup
RUN mv /usr/local/tomcat/webapps/manager/META-INF/context.xml /usr/local/tomcat/webapps/manager/META-INF/context.xml.backup

ADD tomcat /etc/init.d/tomcat
RUN chmod +x /etc/init.d/tomcat
ADD tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml
ADD server.xml /usr/local/tomcat/conf/server.xml
ADD context.xml /usr/local/tomcat/webapps/manager/META-INF/context.xml
ADD keystore.jks /root/keystore.jks

RUN echo "deb http://nginx.org/packages/mainline/debian/ stretch nginx" >> /etc/apt/sources.list
RUN wget http://nginx.org/keys/nginx_signing.key
RUN apt-key add nginx_signing.key
RUN apt-get update -y
RUN apt-get install nginx -y

ADD default.conf /etc/nginx/conf.d/default.conf
ADD spring2-mvc-xml-hello-world-2.0-SNAPSHOT.war /usr/local/tomcat/webapps/spring2-mvc-xml-hello-world-2.0-SNAPSHOT.war

RUN sh /etc/init.d/nginx start 
RUN service nginx start

EXPOSE 80 8080 443 8443

RUN sh /etc/init.d/nginx start
RUN service nginx start
RUN service nginx status

CMD ["catalina.sh","run"]
