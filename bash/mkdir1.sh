
pass1(){ 
 print_func
local  dir=/tmp/2
  mkdir1 $dir
  ensure "test -d $dir" 
echo 1 > /tmp/1
cat1 /tmp/1
}

fail1(){
 bla bla
}

pass1
fail1
