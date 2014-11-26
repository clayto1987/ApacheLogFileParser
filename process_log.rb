count = 0

File.open("access_short.log", "r") do |f|
  f.each_line do |line|
    count = count + 1
    puts line
    my_string_array = line.scan(/"[^"]+"|\[[^\[\]]+\]|\S+/).map { |word| word.delete('"') }
    puts my_string_array.inspect
    puts my_string_array.count
  end
end

puts count

