# org.mera.web #
```
FROM maven:3.5.0-jdk-8 AS builder

# speed up Maven JVM a bit
ENV MAVEN_OPTS=”-XX:+TieredCompilation -XX:TieredStopAtLevel=1″

# make source folder
RUN mkdir -p /app
WORKDIR /app

# copy other source files (keep code snapshot in image)
COPY app-src/pom.xml /app
COPY app-src/src /app/src

# run packaging
RUN mvn package -T 1C

# customize base JDK version here
FROM tomcat:latest
MAINTAINER skyikho@acornsoft.io
COPY –from=builder /app/target/ROOT.war /usr/local/tomcat/webapps/
EXPOSE 8080
```

# google cloud run install #
```
docker build . --tag gcr.io/wish-quiz-project/mera-admin-taiwan-server
docker push gcr.io/wish-quiz-project/mera-admin-taiwan-server
gcloud run deploy --image gcr.io/wish-quiz-project/mera-admin-taiwan-server --region asia-east1 --platform managed

gcloud builds submit --tag gcr.io/wish-quiz-project/mera-admin-taiwan-server

gcloud app deploy src/main/appengine/prod/wish-quiz-project-app.yaml

```

# docker install #
```
> doctl registry create wish
> doctl registry login
> docker login registry.digitalocean.com

> docker build -t registry.digitalocean.com/do-mera-registry/mera-admin .
> docker push registry.digitalocean.com/do-mera-registry/mera-admin
> docker pull registry.digitalocean.com/do-mera-registry/mera-admin
>
> docker container run --rm -it -p 8082:8080 registry.digitalocean.com/do-mera-registry/mera-admin
```

## docker ksoh1013 upload
```
> docker login ksoh1013.synology.me
    merauser/merauser1q2w3e
> docker build -t ksoh1013.synology.me/mera-admin .
> docker push ksoh1013.synology.me/mera-admin
> docker pull ksoh1013.synology.me/mera-admin
> docker container run --rm -it -p 8081:8080 ksoh1013.synology.me/mera-admin

docker container run --rm -it -p 8081:8080 --log-driver local --log-opt max-size=10m ksoh1013.synology.me/mera-admin

> docker image tag mera-quiz/mera-gtrend:latest ksoh1013.synology.me/mera-gtrend:latest

> sudo docker images -a | grep '<none>' | awk '{print $3}' | xargs sudo docker rm
> sudo service docker restart

```
