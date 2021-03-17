#FROM maven:3.5.0-jdk-8 AS builder

# speed up Maven JVM a bit
#ENV MAVEN_OPTS="-XX:+TieredCompilation -XX:TieredStopAtLevel=1"

# make source folder
#RUN mkdir -p /app
#WORKDIR /app

# copy other source files (keep code snapshot in image)
#COPY ./pom.xml /app
#COPY ./src /app/src

# run packaging
#RUN mvn package -T 1C

# customize base JDK version here
#FROM tomcat:latest
#COPY –from=builder /app/target/ROOT.war /usr/local/tomcat/webapps

FROM tomcat:8.0.51-jre8-alpine
#FROM tomcat:latest
RUN rm -rf /usr/local/tomcat/webapps/*
COPY ./target/ROOT.war /usr/local/tomcat/webapps
EXPOSE 8080
ENV JAVA_OPTS="-Dspring.profiles.active=local"
CMD ["catalina.sh","run"]

#FROM gcr.io/google-appengine/jetty
#ADD ./target/ROOT.war $JETTY_BASE/webapps/root.war
#WORKDIR $JETTY_BASE
#ENV spring.profiles.active google
#RUN java -jar $JETTY_HOME/start.jar --approve-all-licenses --add-to-startd=jmx,stats,hawtio && chown -R jetty:jetty $JETTY_BASE
