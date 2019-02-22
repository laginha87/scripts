COLORS = {
    red: 31,
    green: 32,
    blue: 34
}

class String
    def colorize(color)
        "\033[#{COLORS[color]}m#{self}\033[0m"
    end
end

files = Dir[File.expand_path "~/Dropbox/Cabinet/Input/*"]
if files.length > 0
    puts "There are #{files.length} files in the cabinet's input".colorize(:green)
    puts files
else
    puts "There are no files in the cabinet input".colorize(:red)
end

input_file = File.expand_path "~/Dropbox/Cabinet/input.txt"
file =  File.read(input_file)

color = file.lines.length > 50 ? :red : file.lines.length > 20 ? :blue : :green
puts "This is the content of the input.txt".colorize(color)
puts input_file.colorize(:blue)

puts file

