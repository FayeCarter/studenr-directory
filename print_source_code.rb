@directory = []

def get_files
  Dir.children(__dir__).each_with_index do |file, index|
    puts "#{index}. #{file}"
    @directory << {index: index, file: file}
  end
end

def pick_file
  chosen_file = ""
  puts "Which file do you want to read? (enter number)"
  choice = gets.chomp.to_i
  @directory.each do |object|
    if object[:index] == choice
      chosen_file =  object[:file]
    end
  end
  print_source_code(chosen_file)
end

def print_source_code(filename)
  puts "Contents of #{filename}: \n\n"
  
  File.open(filename, 'r') do |file|
    file.readlines.each do |i|
      puts i
    end
  end
end

def run
 get_files
 pick_file
end

run