#!/usr/bin/env ruby

$:.unshift File.dirname(__FILE__) + "/lib"
require "master_mind"

game = MasterMind.new
until game.victory?
  puts "Enter score for #{game.guess}"
  game.respond_with gets
end
puts "Game Over!"
