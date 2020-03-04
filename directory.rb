# Define methods
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  i = 0
  until i == students.length
    puts "#{i + 1}. #{students[i][:name]} (#{students[i][:cohort]} cohort)."
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

def interactive_menu
  students = []
  loop do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    selection = gets.chomp
    case selection 
      when "1"
        students = input_students
      when "2"
        if students.count > 0
          print_header
          print(students)
          print_footer(students)
        else
          print_footer(students)
        end
      when "9"
        exit
      else
        puts "Try again"
    end
  end
end

interactive_menu