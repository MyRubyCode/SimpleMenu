require_relative 'Course'

@courses_arr = Array.new
@users_arr = Array.new
@courses = Array.new
@userInput


def print_courses_info
	@courses.each {|c| c.print_line}
end

def add_course_object()
	# need to implement the course details from the user input
	@courses << Course.new()
end

def select_menu_action(var)
    if @userInput == 1
    	print_course_list
    elsif @userInput == 2
    	register
    elsif @userInput == 3
    	add_course
    elsif @userInput == 4
    	print_something(@userInput)
    elsif @userInput == 5
    	print_something(@userInput)
    else
    	puts "exit"
    end
end

def print_menu
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
    
end


def print_something(var)
	puts "user choise from function: #{var}"
end


def register()
	puts "Enter Your Name: "
	userName = gets.chomp
	@users_arr.push(userName)
	
	puts "Enter Your Age: "
	userAge = gets.chomp
	puts "Enter Your Major: "
	userMajor = gets.chomp
	
	print_users_list
	
	#puts "\n---------------------\nUser Information:\n\nUser Name: #{userName}\nUser Age: #{userAge}\nUser Major: #{userMajor}\n---------------------\n\n"
end


def add_course()
   puts "Enter course name: "
   course_name = gets.chomp
   @courses_arr.push(course_name)
end


def print_course_list()
    puts "\n---------------------\nCourses Information:\n\n"
    @courses_arr.each {|item| puts item } 
    puts "---------------------\n"
end


def print_users_list()
    puts "\n---------------------\nUsers Information:\n\n"
   @users_arr.each {|item| puts item } 
    puts "---------------------\n"
end


while 1 == 1
    print_menu
    @userInput = gets.chomp.to_i

    while @userInput < 1 or @userInput > 6
    	@userInput = gets.chomp.to_i
    end

    select_menu_action(@userInput)
end