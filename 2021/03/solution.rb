#!/usr/bin/env ruby

require './submarine_diagnostic'

puzzle_input = File.read('./input.txt')
puts "According to the report power consumption is: #{SubmarineDiagnostic.new(puzzle_input).power_consumption}"
puts "According to the report life support rating is: #{SubmarineDiagnostic.new(puzzle_input).life_support_rating}"