require 'csv'
@students = []

def create_student(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)."
  end
end

def student_count
  if @students.count > 1
    puts "Overall, we have #{@students.count} great students"
  else
    puts "Overall, we have #{@students.count} great student"
  end
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
    student_count
    name = gets.chomp
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

def save_students(filename = 'students.csv')
  CSV.open(filename, "w") do |file|
    @students.each do |student|
      file << [student[:name], student[:cohort]]
    end
  end
end

def load_students(file = 'students.csv')
  CSV.foreach(file) do |row|
    name, cohort = row
    create_student(name, cohort)
  end
end

def show_students
    print_header
    print_student_list
    student_count
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
    puts "Students saved to file"
  when "4"
    load_students
    puts "Students loaded from file"
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