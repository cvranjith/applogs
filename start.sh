#!/bin/bash
l_xml=/usr/local/tomcat/conf/tomcat-users.xml
APP_USER=${APP_USER:-"loguser"}
echo "Going to configure  ${APP_USER}"
echo "<?xml version='1.0' encoding='utf-8'?>
<tomcat-users>
  <role rolename=\"logs\"/>
  <user username=\"${APP_USER}\" password=\"${APP_USER_PASSWORD}\" roles=\"logs\"/>"  > ${l_xml}
    for i in {1..100}
    do
        l_var="APP_USER_${i}"
        l_user=${!l_var}
        echo "$i : ${l_var} : ${l_user}" 
        if [[ "${l_user}" == "" ]]
        then
            echo "APP_USER_${i} is not set"
            break
        fi
        l_var="APP_USER_${i}_PASSWORD"
        l_pass=${!l_var}
        echo "  <user username=\"${l_user}\" password=\"${l_pass}\" roles=\"logs\"/>"  >> ${l_xml}
    done
echo "</tomcat-users>" >> ${l_xml}
#cat /usr/local/tomcat/conf/tomcat-users.xml

echo "Going to start Catalina"

/usr/local/tomcat/bin/catalina.sh run
