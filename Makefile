# Introduction to Makefile                                                                                                                                                                                                
some_file: other_file                                                                                                                                                                                                       
	echo "Run second"

other_file:                                                                                                                                                                                                                
	echo "This will run first"
	touch other_file                                                                                                                                                                                                          

blah: blah.o                                                                                                                                                                                                                
	cc blah.o -o blah                                                                                                                                                                                                                                                                                                                                                                                                                                      
blah.o: blah.c                                                                                                                                                                                                           
	cc -c blah.c -o blah.o                                                                                                

blah.c:                                                                                                                                                                                                                    
	echo "int main(){ return 0; }" > blah.c                                                                                                                                                                                    

# Variables                                                                                                                                                                                                                 
# := means 'simple expansion'                                                                                                                                                                                               
# = means 'verbatim assignment'               

files := file1 file2                                                                                                                                                                                                       
derick := "You are my boy derick!"
some_file1: $(files)                                                                                                                                                                                                    
	echo "Look at theis variable: " $(files)                                                                                                                                                                                 
	touch some_file1                                                                                                                                

file1:
	touch file1                                                                                                                                                                                                             

file2:
	touch file2                                                                                                                                                                                                               

clean:
	rm -f file1 file2 some_file* other_file bla*

all:
	echo $(files)

# Automatic variable and wildcards
# '$@' affects each of the the item in a target(just like loop)
# '$?' affects all prerequisite newer than target
# '$^' affects all prerequites
print: $(wildcard *.c)
	echo $@ 
	ls -la $?