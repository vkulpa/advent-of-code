#!/usr/bin/env ruby

basedir = File.dirname(File.expand_path(__FILE__))
$: << basedir
$: << File.expand_path('../..', basedir)

require 'sonar'

puzzle_input = File.read("#{basedir}/input.txt")
puts "Sonar measurements: #{Sonar.new(puzzle_input).calculate.total}"
puts "Sonar measurements (without noise): #{Sonar.new(puzzle_input).calculate_skip_noise.total}"