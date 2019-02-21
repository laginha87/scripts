require "fileutils"
desc "Installs it"
task :install do
    Dir["src/*.rb"].each do |f|
        puts "Installing #{f}"
        name = f.split("/").last.split(".").first
        file_path = "/opt/bin/#{name}"
        i = File.open(file_path, "w+")
        i.puts("#!/usr/bin/env ruby")
        i.write(File.read(f))
        i.close

        FileUtils.chmod("+x", file_path)
    end
end