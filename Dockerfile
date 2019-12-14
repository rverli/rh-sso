FROM registry.access.redhat.com/redhat-sso-7/sso73-openshift

USER root

ARG DB_ADDR
ARG DB_PORT
ARG DB_DATABASE
ARG JDBC_PARAMS
ARG DB_USER
ARG DB_PASSWORD

## Add Oracle JAR to /extensions directory
ARG FILE_NAME=postgres-jdbc.jar

ADD /extensions /extensions
ADD actions.cli /extensions/scripts/actions.cli
ADD docker-entrypoint.sh /docker-entrypoint.sh

RUN chmod +x $JBOSS_HOME/bin/add-user-keycloak.sh
RUN $JBOSS_HOME/bin/add-user-keycloak.sh --user admin --password admin

RUN chmod a+x -R /docker-entrypoint.sh

ADD themes/id-rio.tar.gz $JBOSS_HOME/themes/
RUN chown -R jboss:root $JBOSS_HOME/themes/id-rio
RUN chmod -R 775 $JBOSS_HOME/themes/id-rio

EXPOSE 8080 8443

USER jboss

ENTRYPOINT ["/docker-entrypoint.sh"]