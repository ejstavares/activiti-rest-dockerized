# activiti-rest-dockerized
**VERSION:** activiti-6.0.0

Tomee 8.0.6 - Apache Tomcat/9.0.68

## Dockerfile to build an Activiti BPM container image.

1- Execute compose file AND build Docker image for activit based on jre-8-tomee-8.0.6-plus

```bash
  docker-compose up -d --build
 ```

2- Access the REST resources via (on H2 DB):

```bash
  http://<ip of docker host>:<container's 8888 port>/activiti-rest
```

3- (optional) Set PostgreSQL config - Copy db.properties files via follow script:

```bash
  bash scripts/01-copy-postgres-jar.sh
```

4- After copying PostgreSQL configuration to container restart him:

```bash
  docker restart activiti-rest
```

5- (optional) See container logs:

```bash
  docker logs activiti-rest -f
```
