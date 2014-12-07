
middle=mkdir1
source config.cfg

step1(){
local file="bash/${middle}.sh"
commander chmod +x $file
commander $file
}

step1
