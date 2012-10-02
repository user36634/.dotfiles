#!/usr/bin/env ruby

home = File.expand_path(ENV['HOME'])

Dir['*'].each do |file|
  next if file =~ /(install.rb)|(README.md)|(filetypes)/
  target = File.join(home, ".#{file}")
  puts "installing #{File.expand_path file} to #{target}"
  `ln -fis #{File.expand_path file} #{target}`
end

