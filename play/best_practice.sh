#http://www.centurylinklabs.com/15-quick-docker-tips/

get_id(){
ID=$(docker run ubuntu echo hello world)
#hello world
$ docker commit $ID hello world
fd08a884dc79
}

keep_asign_id(){
But you have to keep assigning IDs. Try this instead:
$ alias dl='docker ps -l -q'
$ docker run ubuntu echo hello world
hello world
$ dl
1904cf045887
$ docker commit `dl` hello world
fd08a884dc79
}

use_shell_to_run_dockerfile_cmd(){
$ docker run -i -t ubuntu bash
root@db0c3978abf8:/# apt-get install postgresql -y
root@db0c3978abf8:/# exit
$ docker commit -run='{"Cmd":["postgres", "-too -many -opts"]}' `dl` postgres # ugly long command, easier to do within a Dockerfile
5061b88e4cf0
Instead, make a wee little Dockerfile that is FROM the image you made interactively
There you can set CMD, ENTRYPOINT, VOLUME, etc.
}

run_docker_without_root(){
Su-su-sudo
Here is how to run Docker without root:
$ sudo groupadd docker
$ sudo gpasswd -a myusername docker
$ sudo service docker restart
$ exit
}


rm_all_containers(){
Take out the garbage
Here is how to delete all stopped containers (useful if you need to re-run named containers):
$ docker rm $(docker ps -a -q)
}


inspect_container(){
#USING JSON PARSER

jq – the gangsta way to parse docker inspect's output
Here is how to grab the IP address in one line of unix:
$ docker inspect `dl` | grep IPAddress | cut -d '"' -f 4
172.17.0.52

$ docker inspect `dl` | jq -r '.[0].NetworkSettings.IPAddress'
172.17.0.52
}
