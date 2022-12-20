FROM tomee:jre8-plus
		
LABEL mantainer="ederlino.tavares@gmail.com"

EXPOSE 8080
WORKDIR /usr/local/tomee/
COPY tomcat-users.xml ./conf/
COPY context.xml ./webapps/manager/META-INF/
COPY postgresql-42.2.8.jar ./lib/
ADD activiti-rest.war ./webapps/

COPY index.jsp ./webapps/ROOT
