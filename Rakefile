require "bundler/gem_tasks"

desc "generate documentation"
task :doc do
  f = File.open("./lib/siriproxy-sirimingle.rb")
  commands = []
  f.each_line {|l| commands << l if l.include?("listen_for") }
  commands.each do |c| 
    command = c.split("do")
    puts "Any command that contains : #{command.first.split("listen_for").last}"
  end
  
end
