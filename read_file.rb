count = 0

File.open("access.log", "r") do |f|
  f.each_line do |line|
    count = count + 1
    puts line
  end
end

puts count