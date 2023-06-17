# this is multi stage 
FROM openjdk:11
WORKDIR /opt/gradle/CICD_Java_gradle_application
COPY . . 
RUN chmod +x gradlew
RUN ./gradlew build 

FROM tomcat:9
WORKDIR webapps
#COPY --from=base /tmp/build/libs/sampleWeb-0.0.1-SNAPSHOT.war .
#RUN rm -rf ROOT && mv sampleWeb-0.0.1-SNAPSHOT.war ROOT.war
