# Define methods
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  i = 0
  until i == students.length
    output = "#{i + 1}. #{students[i][:name]} (#{students[i][:cohort]} cohort) is #{students[i][:age].to_s} years old and enjoys #{students[i][:hobby]}"
    puts output.center(80)
    i += 1
  end
end

def print_footer(names)
  if names.count > 1
    puts "Overall, we have #{names.count} great students"
  else
    puts "Overall, we have #{names.count} great student"
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.delete("\n")
  while !name.empty? do
    puts "what cohort is #{name}?"
    cohort = gets.chomp.to_sym
    cohort = :march if cohort.empty?
    puts "How old is #{name}?"
    age = gets.chomp
    age = "N/A" if age.empty?
    puts "What hobby does #{name} have?"
    hobby = gets.chomp
    hobby = "N/A" if hobby.empty?
    students << {name: name, cohort: cohort, hobby: hobby, age: age}
    if students.length > 1
      puts "Now we have #{students.count} students"
    else
      puts "Now we have #{students.count} student"
    end
    # get another name from the user
    name = gets.chomp
  end
  #return the array of students
  students
end

def print_starts_with(students)
  puts "Pick a letter"
  letter = gets.chomp
  students.each do | student |
    if student[:name][0].downcase == letter.downcase
      puts student[:name]
    end
  end
end

def short_names(students)
  students.each do | student |
    if student[:name].length < 12
      puts student[:name]
    end
  end   
end 

def students_by_cohort(students)
  puts "Pick a cohort"
  choice = gets.chomp
  students.map do |student|
    if student[:cohort] == choice.to_sym
      puts student[:name]
    end
  end
end
# Call methods
students = input_students
print_header
print(students)
print_footer(students)
