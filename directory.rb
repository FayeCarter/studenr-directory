require 'csv'
@students = []

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)."
  end
end

def print_footer
  if @students.count > 1
    puts "Overall, we have #{@students.count} great students"
  else
    puts "Overall, we have #{@students.count} great student"
  end
end

def create_student(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = gets.delete("\n")
  while !name.empty? do
    puts "what cohort is #{name}?"
    cohort = gets.chomp
    cohort = :march if cohort.empty?
    create_student(name, cohort)
    if @students.length > 1
      puts "Now we have #{@students.count} students"
    else
      puts "Now we have #{@students.count} student"
    end
    name = gets.chomp
  end
end

def load_students(file = 'students.csv')
  CSV.foreach(file) do |row|
    name, cohort = row
    create_student(name, cohort)
  end
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

def show_students
  if @students.count > 0
    print_header
    print_student_list
    print_footer
  else
    print_footer
  end
end

def save_students(filename = 'students.csv')
  CSV.open(filename, "w") do |file|
    @students.each do |student|
      file << [student[:name], student[:cohort]]
    end
  end
end



def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit
  else
    puts "Try again"
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end



interactive_menu