#!/usr/bin/env ruby

require './submarine'

puzzle = File.read('./input.txt')

puts "Following course submarine is in the position: #{Submarine.new(puzzle).calculate.position}"
puts "Following course submarine is in the aim position: #{Submarine.new(puzzle).calculate_aim.position}"