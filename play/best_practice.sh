
#http://www.centurylinklabs.com/15-quick-docker-tips/
ip_of_container(){
#Does a Docker container have its own IP address?
#Yes. It is like a process with an internal IP address
ip -4 -o addr show eth0
#2:
#eth0    inet 162.243.139.222/24
docker run ubuntu ip -4 -o addr show eth0
#149:
#eth0    inet 172.17.0.43/16
}

cmd_vs_entrypoint(){
CMD vs ENTRYPOINT instruction
CMD arguments can be over-ridden:
cat Dockerfile
FROM ubuntu
CMD ["echo"]
ENTRYPOINT ["echo"]
}

cmd_vs_run(){
RUN apt-get update
RUN apt-get install softwares
# docker run will run this command by default:
CMD ["softwares"]
}



get_id(){
ID=$(docker run ubuntu echo hello world)
#hello world
docker commit $ID hello world
#fd08a884dc79
}

keep_asign_id(){
#But you have to keep assigning IDs. Try this instead:
 alias dl='docker ps -l -q'
 docker run ubuntu echo hello world
#hello world
 dl
#1904cf045887
 docker commit `dl` hello world
#fd08a884dc79
}

use_shell_to_run_dockerfile_cmd(){
docker run -i -t ubuntu bash
#root@db0c3978abf8:/# apt-get install postgresql -y
#root@db0c3978abf8:/# exit
docker commit -run='{"Cmd":["postgres", "-too -many -opts"]}' `dl` postgres # ugly long command, easier to do within a Dockerfile
#5061b88e4cf0
#Instead, make a wee little Dockerfile that is FROM the image you made interactively
#There you can set CMD, ENTRYPOINT, VOLUME, etc.
}

run_docker_without_root(){
#Su-su-sudo
#Here is how to run Docker without root:
 sudo groupadd docker
 sudo gpasswd -a myusername docker
 sudo service docker restart
 exit
}


rm_all_containers(){
#Take out the garbage
#Here is how to delete all stopped containers (useful if you need to re-run named containers):
docker rm $(docker ps -a -q)
}


inspect_container(){
#USING JSON PARSER

#jq – the gangsta way to parse docker inspect\'s output
#Here is how to grab the IP address in one line of unix:
 docker inspect `dl` | grep IPAddress | cut -d '"' -f 4
#172.17.0.52

 docker inspect `dl` | jq -r '.[0].NetworkSettings.IPAddress'
#172.17.0.52
}

find_env_for_linking(){
 # What environment variables does an image have?
#This is especially nice when using docker run --link to connect containers:
docker run ubuntu env
#HOME=/
#PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
#container=lxc
#HOSTNAME=5e1560b7f757
}
