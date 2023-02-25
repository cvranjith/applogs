FROM tomcat:jre8-openjdk-slim-buster
COPY applogs.war /usr/local/tomcat/webapps/
COPY start.sh /usr/local/tomcat/conf/
RUN chmod +x /usr/local/tomcat/conf/start.sh
ENTRYPOINT ["/usr/local/tomcat/conf/start.sh"]
