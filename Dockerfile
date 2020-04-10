#WITHOUT MAVEN BECAUSE O THE MAVEN MAKES THE PROCESS SLOW
#FROM openjdk:11
FROM  adoptopenjdk/maven-openjdk11:latest

ARG PROF
ARG OPTS

ENV PROF=${SPRING_PROFILE}
ENV OPTS=${DEBUG_OPTS}

WORKDIR /opt/dockerdebug

#INCLUIDING MAVEN
COPY . ./
RUN mvn clean package

#WITHOUT MAVEN, BECAUSE O THE MAVEN MAKES THE PROCESS SLOW
#COPY /target/*.jar app.jar

RUN cp ./target/*.jar ./app.jar

SHELL ["/bin/sh", "-c"]

EXPOSE 8080
EXPOSE 5005

CMD java ${OPTS} -jar app.jar --spring.profiles.active=${PROF}