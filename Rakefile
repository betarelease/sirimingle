require "bundler/gem_tasks"
require "bundler/version"
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task :default => :build

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

task :build => :spec do
  system "gem build siriproxy-sirimingle.gemspec"
end
 
task :release => :build do
  system "gem push siriproxy-sirimingle-0.0.2"
end
