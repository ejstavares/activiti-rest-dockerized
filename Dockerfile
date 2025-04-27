# Etapa 1: Usando openjdk:8-jdk para descompactar o WAR
FROM openjdk:8-jdk as unpack-stage

# Expondo a porta padrão
EXPOSE 8080

# Definindo o diretório de trabalho
WORKDIR /tmp
# Copiando o WAR do Activiti REST
COPY activiti-rest.war .
RUN mkdir -p /activiti-rest
RUN mv activiti-rest.war /activiti-rest/
WORKDIR /activiti-rest

# Descompactando o WAR para o diretório /activiti-rest
RUN jar -xvf activiti-rest.war
# Removendo o WAR descompactado
RUN rm activiti-rest.war

# Etapa 2: Usando a imagem base do TomEE para rodar a aplicação
FROM tomee:jre8-plus
LABEL maintainer="ederlino.tavares@gmail.com"

# Expondo as portas do TomEE
EXPOSE 8080
EXPOSE 8443

# Definindo o diretório de trabalho
WORKDIR /usr/local/tomee/

# Copiando o driver PostgreSQL para a pasta lib do TomEE
COPY postgresql-42.2.8.jar ./lib/

# Copiando os arquivos descompactados da etapa anterior para a pasta webapps
COPY --from=unpack-stage /activiti-rest /usr/local/tomee/webapps/activiti-rest

# Copiando uma página inicial, se necessário
COPY index.jsp ./webapps/ROOT/

COPY db.properties ./webapps/activiti-rest/WEB-INF/classes/db.properties.example.postgresql

# Configuração de inicialização automática do TomEE
CMD ["catalina.sh", "run"]