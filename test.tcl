puts hello
set a "Hello World!"
puts $a
set b "puts hi"
eval $b
puts "--------------------------------"
 
set str "this is a string"
puts "the string is :$str"
puts "the length of the string is :[string length $str]"
puts "the character at index 3 is:[string index $str 3]"
puts "the character from index 4 though 8 are:[string range $str 4 8]"
puts "the index of the first occurrence of letter\"i\"is:[string first i $str]"
puts "---------------------------------"

set value [expr 0==1]   ;#the usage of expr
puts $value
puts "I am [expr 10*2] years old, and my I.Q is [expr 100-25]"
puts "---------------------------------"

foreach vowel { a e i o u } {
	puts "$vowel is a vowel"
}
puts "---------------------------------"

proc sum_proc {a b } {
	return [expr $a+$b]
}
proc magnitude {num} {
	if {$num>0} {
		return $num
	}
	set num [expr $num*(-1)]
	return $num	
}
set num1 12
set num2 14
set sum [sum_proc $num1 $num2]
puts "The sum is $sum"
puts "The magnitude of 3 is [magnitude 3]"
puts "The magnitude of -2 is [magnitude -2]"

puts "---------------------------------"

proc dumb_proc {} \
{
	set myvar 4
	puts "The value of the local variable is $myvar"
	global myglobalvar
	puts "the value of the global variable is $myglobalvar"
}

set myglobalvar 79
dumb_proc

puts "---------------------------------"
set myarray(0) "Zero"
set myarray(1) "One"
set myarray(2) "Two"
for {set i 0} {$i < 3} {incr i} {
	puts $myarray($i)
}
set person_info(name) "Fred Smith"
set person_info(age) "25"
set person_info(occupation) "Plumber"
;#foreach thing {name age occupation} {
foreach thing [array names person_info] {	
	puts "$thing == $person_info($thing)"
}

puts "---------------------------------"
set f [open "/tmp/myfile" "w"]
puts $f "We live in Beijing."
puts $f "456"
close $f

set infile [open "/file.txt" "r"]
while {[gets $infile Op]>=0} {
	set Operation "expr $Op"
	set Result [eval $Operation]
	puts stdout "$Op = $Result"
}


;#the usage of upvar
proc decr {n m} \
{
	upvar $n upa
	set upa [expr $upa - $m]
}
set nb 12
decr nb 3
puts $nb

;#the usage of uplevel
puts "---------------------------------"
# proc div {a b} \
# {
# 	if {$b == 0} {
# 		error "divided by Zero"
# 	} else {
# 		return [expr $a/$b]
# 	}
# }
# div 8 3
# div 8 0
# catch {div 8 3}
# catch {div 8 0}

