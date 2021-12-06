#!/usr/bin/env ruby

require './sonar'

puzzle_input = File.read('./input.txt')
puts "Sonar measurements: #{Sonar.new(puzzle_input).calculate.total}"
puts "Sonar measurements (without noise): #{Sonar.new(puzzle_input).calculate_skip_noise.total}"