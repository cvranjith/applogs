# applogs


Applog docker image is a simple Custom java (jsp) application running in tomcat. The functionality is limited to list the files on the server, and download them using browser.



###Docker run arguments

note

    Internal directory /logs  to be mounted to the host directory that you want to browse.
    Internal port 8080 to be mapped to the external port
    The war file is having basic authentication. Default user is "loguser". The default username can be changed by supplying env var -e APP_USER=<your-user-id>
    Default user password to be supplied in env var APP_USER_PASSWORD
    Additional users / passwords can be provided using env vars APP_USER_n, APP_USER_n_PASSWORD
        (i.e APP_USER_1, APP_USER_1_PASSWORD , APP_USER_2, APP_USER_2_PASSWORD and so on)

docker run -itd \
-p 8082:8080 \
-v /tmp:/logs \
-e APP_USER_PASSWORD=OXPxq \
-e APP_USER_1=ranji \
-e APP_USER_1_PASSWORD=Jang001 \
--name applogs \
fsgbu-mum-128.snbomprshared1.gbucdsint02bom.oraclevcn.com:5000/utils/applogs:1.0



#### war build:
create war file 

```
cd src
jar -cvf applogs.war *
```


#### Dockerfile

Copy the files "applogs.war" and "start.sh" 

```
FROM tomcat:jdk8-corretto
COPY applogs.war /usr/local/tomcat/webapps/
COPY start.sh /usr/local/tomcat/conf/
RUN chmod +x /usr/local/tomcat/conf/start.sh
ENTRYPOINT ["/usr/local/tomcat/conf/start.sh"]
```

Docker build
```
docker build -t applogs:1.0 .
```

