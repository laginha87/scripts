require 'io/console'

option = ARGV[0]

unless option
    `code ~/Dropbox/Cabinet`
    return
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

options = options[:full].nil? ? options[:partial] : options[:full]

if options.length == 1
    `code #{options[0]}`
    return
end

options.each_with_index do |option, index|
    puts "#{index}: #{option}"
end

answer = STDIN.getch
if(answer.to_i.to_c != answer || !options[answer.to_i])
    print("Wrong Option")
    return
end

`code #{options[answer.to_i]}`