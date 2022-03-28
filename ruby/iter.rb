def WHILE(cond)
    return if not cond
    	yield
    retry
end

i=0; WHILE(i<3){
    print i; i+=1
}
