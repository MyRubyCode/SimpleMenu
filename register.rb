def print_something(var)
	puts "user choise from function: #{var}"
end

def register()
	puts "Enter Your Name: "
	userName = gets.chomp
	puts "Enter Your Age: "
	userAge = gets.chomp
	puts "Enter Your Major: "
	userMajor = gets.chomp
	puts "\n---------------------\nUser Information:\nUser Name: #{userName}\nUser Age: #{userAge}\nUser Major: #{userMajor}\n---------------------\n\n"
end

welcomStr = "\n********************************
welcome to the registration site
********************************\n
Please enter your choice\n
1. List of courses\n
2. Register students\n
3. Add course\n
4. Remove course\n
5. Stodent info\n
6. Quit"

puts welcomStr
userInput = gets.chomp.to_i

while userInput < 1 or userInput > 6
	userInput = gets.chomp.to_i
end

if userInput == 1
	print_something(userInput)
elsif userInput == 2
	register
elsif userInput == 3
	print_something(userInput)
elsif userInput == 4
	print_something(userInput)
elsif userInput == 5
	print_something(userInput)
else
	puts "exit"
end




