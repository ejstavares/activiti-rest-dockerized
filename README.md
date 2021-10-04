# activiti-rest-dockerized
## Dockerfile to build an Activiti BPM container image.

1- Execute compose file AND build Docker image for activit based on jre-8-tomee-8.0.6-plus

`docker-compose up -d --build`

2- Access the REST resources via (on H2 DB):

`http://<ip of docker host>:<container's 8888 port>/activiti-rest`

3- (optional) Set PostgreSQL config - Copy .jar and db.properties files via follow script:

`bash scripts/01-copy-postgres-jar.sh`

4- After copying PostgreSQL configuration to container restart him:

`docker restart activiti-rest`

5- (optional) See container logs:

`docker logs activiti-rest -f`
