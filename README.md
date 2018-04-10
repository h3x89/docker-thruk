# thruk
thruk for docker


# build
╰─$ docker build -t docker-thruk .

# RUN
Deamon
╰─$ docker run -dit  -p 80:80 --name docker-thruk docker-thruk

Log:
╰─$ docker run -it -p 80:80 --name docker-thruk docker-thruk


# LOG
╰─$ docker exec -it docker-thruk bash                         

# RM
docker rm docker-thruk

# KILL
docker kill docker-thruk

# USER and PASS
default user 'thrukadmin' with password 'thrukadmin'
