puts "Contents of  #{__FILE__}: \n\n"

File.open(__FILE__, 'r') do |file|
  file.readlines.each do |i|
    puts i
  end
end