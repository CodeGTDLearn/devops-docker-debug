# ATERACOES GLOBAIS:
# A) IDE:
#    - Project / Project JDK
#    - Project / Project Language Level
#    - Modules / Language Level
#    - Platform Setting / SDK
#    - (IDE): Maven Clean + Package

# B) POM:
#    - <java.version>11</java.version>
#    - Plugin
#      <artifactId>spring-boot-maven-plugin</artifactId>
#      <configuration>
#          <excludeDevtools>false</excludeDevtools>

# C) DOCKER-COMPOSE:
#  C.1) JDK11:
#   - ADDITIONAL_OPTS=-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:5005 -Xmx1G -Xms128m -XX:MaxMetaspaceSize=128m
#  C.2) JDK08:
#   - ADDITIONAL_OPTS=-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005 -Xmx1G -Xms128m -XX:MaxMetaspaceSize=128m

# DOCKERFILE
# A) JDK'S:
#    - ALPINE-VERSIONS: They are slim and faster
# A.1) JDK11
#FROM openjdk:11
# A.2) JDK8
FROM openjdk:8-alpine

WORKDIR /opt/debug-app-api

# B) TARGET FOLDER:
#    - Must be generated beforehand
#      * use mvn clean package
COPY /target/*.jar debug-app-api.jar

SHELL ["/bin/sh", "-c"]

# C) PORTS:
#    C.1) 8080: Attach the WebApp by itself;
#    C.2) 5005: Attach the debbuger
EXPOSE 8080
EXPOSE 5005

# D) DOCKER-COMPOSE - ENVIRONMENTAL VARIABLES
#    D.1) "DEBUG_OPTIONS"
#    D.2) "PROFILE"
CMD java ${DEBUG_OPTIONS} -jar debug-app-api.jar --spring.profiles.active=${PROFILE}