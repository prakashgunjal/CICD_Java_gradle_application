FROM openjdk:11 as base
WORKDIR /var/lib/jenkins/workspace/Package/build/libs
COPY . .
RUN +x gradlew
RUN ./gradlew build

FROM tomcat:9
WORKDIR webapps
COPY --from=base /app/build/libs/sampleWeb-0.0.1-SNAPSHOT.war .
RUN rm -rf  ROOT && sampleWeb-0.0.1-SNAPSHOT.war ROOT.war
