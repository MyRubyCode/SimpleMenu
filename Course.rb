class Course
	@id; @name; @teacher; @day; @room; 
	
	def initialize(id, name, teacher, day, room)
		@id = id
		@name = name 
		@teacher = teacher 
		@day = day 
		@room = room
	end
	
	def print_line()
		printf("%d %-20s %-20s %-20s %-20s", @id, @name, @teacher, @day, @room )
	end	
end
