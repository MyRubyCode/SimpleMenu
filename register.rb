require_relative 'Course'
require "rubygems"
require "mysql"

@courses = Array.new
@userInput

# ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# this is MySql connection for MariaDB database.
# in our database (student) we have create three tables with the commands:
# ------------------------------------------------------------------------
# >> create database if not exists student;
# >> use student;
# >> create table if not exists students (id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, name VARCHAR(40) NOT NULL, age INT (3), major VARCHAR(40) NOT NULL, email VARCHAR(100));
# >> create table if not exists classes (studentId INT(3), courseId INT(3));
# >> create table if not exists courses (id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, name VARCHAR(50) NOT NULL, teacher VARCHAR(30), day VARCHAR(4) NOT NULL, room INT(3));
# ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
@@dbcon = Mysql.new('localhost', 'student', 'password', 'student') 

def upload_courses_from_db
	rs = @@dbcon.query('select * from courses') 
	rs.each do |row| 
		courseId = row[0]
		courseName = row[1]
		courseTeacher = row[2]
		courseDay = row[3]
		courseRoom = row[4]
		@courses << Course.new(courseId, courseName, courseTeacher, courseDay, courseRoom)
	end
end

def list_courses_from_db
	rs = @@dbcon.query('select * from courses')  
	rs.each do |row| 
		puts row.join("\s") 
	end
end

def print_courses_info

	puts "\n--------------------------------------------------------------------------------\nCourses Information:\n\n"
    	@courses.each {|item| puts item.print_line } 
    	puts "--------------------------------------------------------------------------------\n"
end

def add_course_object()
	puts "Enter course Id: "	
	courseId = gets.chomp.to_i	
	puts "Enter course name: "
	courseName = gets.chomp
	puts "Enter course teacher: "
	courseTeacher = gets.chomp
	puts "Enter course day: "
	courseDay = gets.chomp
	puts "Enter course room: "
	courseRoom = gets.chomp
	#@courses << Course.new(courseId, courseName, courseTeacher, courseDay, courseRoom)	
end

def select_menu_action(var)
	if @userInput == 1
	print_courses_info
	elsif @userInput == 2
	register
	elsif @userInput == 3
	add_course_object
	elsif @userInput == 4
	print_something(@userInput)
	elsif @userInput == 5
	print_users_list
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
5. Student info\n
6. Quit"

	puts welcomStr
    
end


def print_something(var)
	puts "user choise from function: #{var}"
end


def register()
	puts "Enter Name: "
	userName = gets.chomp
	puts "Enter Age: "
	userAge = gets.chomp.to_i
	puts "Enter Major: "
	userMajor = gets.chomp
	puts "Enter Email: "
	userEmail = gets.chomp

	rs = @@dbcon.query("INSERT INTO students (name, age, major, email) VALUES ('#{userName}', #{userAge}, '#{userMajor}', '#{userEmail}')");
	print_users_list
	
end


def print_users_list()
	rs = @@dbcon.query('select * from students')
	puts "\n---------------------\nUsers Information:\n\n"
	rs.each do |row| 
		puts row.join("\s") 
	end 
	puts "---------------------\n"
	
end

begin
	# only one time we upload the courses from MariaDB
	upload_courses_from_db

	while 1 == 1
		print_menu
		@userInput = gets.chomp.to_i

		while @userInput < 1 or @userInput > 6
		@userInput = gets.chomp.to_i
		end

		select_menu_action(@userInput)
	end
end
