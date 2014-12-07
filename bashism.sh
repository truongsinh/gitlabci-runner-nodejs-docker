
middle=mkdir1
source config.cfg

step1(){
local file="BASH/${middle}.sh"
commander chmod +x $file
commander $file
}

step1
