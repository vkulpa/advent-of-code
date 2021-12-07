#!/usr/bin/env ruby

basedir = File.dirname(File.expand_path(__FILE__))
$: << basedir
$: << File.expand_path('../..', basedir)

require 'submarine_diagnostic'

puzzle_input = File.read("#{basedir}/input.txt")
puts "According to the report power consumption is: #{SubmarineDiagnostic.new(puzzle_input).power_consumption}"
puts "According to the report life support rating is: #{SubmarineDiagnostic.new(puzzle_input).life_support_rating}"