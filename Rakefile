namespace :ror do

  desc "Transfer files to another di"
  task :transfer do
    dir = ENV['DIR'] || File.join(ENV['HOME'], "svnroot_ror_111", "trunk")
    command = "cp -R * #{dir}/"
    puts "running #{command}"
    system command
    puts "Done"
    system "ls #{dir}"
  end
  
  desc "Run all tests"
  task :spec do
    dirs = Dir.glob(File.join(File.dirname(__FILE__), "**", "test", "*test.rb"))
    system "ruby #{dirs.join(' ')}"
  end
end

desc "Run all tests"
task :spec => ["ror:spec"]