require 'io/console'

option = ARGV[0]

def open path
    if([".pdf"].include?(File.extname(path)))
        `open '#{path}'`
    else
        `code '#{path}'`
    end
end

unless option
    `code ~/Dropbox/Cabinet`
    exit
end

options = (Dir[File.expand_path("~/Dropbox/Cabinet/**/*")] + Dir[File.expand_path("~/Dropbox/Cabinet/*")])
    .uniq
    .group_by do |e|
        name = e.split("/").last.downcase.split(".").first
        if(name == option.downcase)
            :full
        elsif(name.start_with?(option.downcase))
            :partial
        else
            :miss
        end
    end

options = (options[:full].nil? ? options[:partial] : options[:full])

unless options
    puts "#{option} Didn't match anything"
    exit
end

if options.length == 1
    open(options[0])
    exit
end

options.each_with_index do |option, index|
    puts "#{index}: #{option}"
end

answer = STDIN.getch


if((answer.to_i.to_s == answer) && options[answer.to_i])
    open(options[answer.to_i])
else
    print("Wrong Option")
end



