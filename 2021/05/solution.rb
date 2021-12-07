#!/usr/bin/env ruby

basedir = File.dirname(File.expand_path(__FILE__))
$: << basedir
$: << File.expand_path('../..', basedir)

require 'hydrothermal_vent'

puzzle_input = File.read("#{basedir}/input.txt")
puts "H/V vent lines overlap: #{HydrothermalVent.new(puzzle_input).calculate.total_overlap}"
puts "H/V/D vent lines overlap: #{HydrothermalVent.new(puzzle_input).calculate_with_diagonals.total_overlap}"