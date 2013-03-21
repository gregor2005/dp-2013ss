if ARGV.size != 2
  puts "usage: ruby tool.rb <input file> <output file>"
  exit
end

file=ARGV[0]
output=ARGV[1]

search_for_element="<element uid"
search_for_sample="<sample uid"
filename="private_file"

content=[]

File.open(file,"r").each do |line|
  if line.include?(search_for_element) || line.include?(search_for_sample)
    new_line = line.split('"')[0]
    new_line << "\"#{filename}\""
    new_line << line.split('"')[2..-1].join('"')
    content << new_line
  else
    content << line
  end
end

output_file = File.new(output,"w")

content.each do |line|
  output_file.puts(line)
end