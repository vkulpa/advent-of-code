#!/usr/bin/env ruby

require './hydrothermal_vent'

puzzle_input = File.read('./input.txt')
puts "H/V vent lines overlap: #{HydrothermalVent.new(puzzle_input).calculate.total_overlap}"
puts "H/V/D vent lines overlap: #{HydrothermalVent.new(puzzle_input).calculate_with_diagonals.total_overlap}"