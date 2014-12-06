install(){
  echo
}
config(){
  trace
}
test(){ 
local  dir=/tmp/2
  mkdir1 $dir
  ensure test -d $dir
echo 1 > /tmp/1
cat1 /tmp/1
blabla
}
commander $@
