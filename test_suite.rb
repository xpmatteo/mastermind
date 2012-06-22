#!/usr/bin/env ruby

$:.unshift("lib")
system "clear"

Dir.glob("test/**/*test.rb") do |file|
  load file
end
