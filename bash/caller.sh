export str_caller1='eval echo $(caller)'
export str_caller2='echo $(caller)'



func2(){
$str_caller1
$str_caller2
eval "$str_caller1" 
eval "$str_caller2" 
}

func1(){
func2
}



func1
