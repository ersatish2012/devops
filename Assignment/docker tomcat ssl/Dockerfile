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

EXPOSE 8080 8443

CMD ["catalina.sh","run"]