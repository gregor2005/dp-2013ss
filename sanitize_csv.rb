if ARGV.size != 2
  puts "usage: ruby tool.rb <input file> <output file>"
  exit
end

file=ARGV[0]
output=ARGV[1]

content=[]

header_passed = false

File.open(file,"r").each do |line|
  if ! header_passed
    content << line
    header_passed = true
  else
    new_line = "private_file,"
    new_line << line.split(",")[1..-1].join(",")
    content << new_line
  end
end

output_file = File.new(output,"w")

content.each do |line|
  output_file.puts(line)
end