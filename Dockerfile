FROM tomee:8-jre-8.0.6-plus
		
LABEL mantainer="ederlino.tavares@gmail.com"

EXPOSE 8080
WORKDIR /usr/local/tomee/
COPY tomcat-users.xml ./conf/
COPY context.xml ./webapps/manager/META-INF/
COPY postgresql-42.1.1.jar ./bin/
ADD activiti-rest.war ./webapps/
# RUN apt install unzip -y && unzip manual.zip && rm manual.zip

COPY index.jsp ./webapps/ROOT
