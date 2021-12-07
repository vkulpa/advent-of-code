#!/usr/bin/env ruby

basedir = File.dirname(File.expand_path(__FILE__))
$: << basedir
$: << File.expand_path('../..', basedir)

require 'submarine'

puzzle = File.read("#{basedir}/input.txt")

puts "Following course submarine is in the position: #{Submarine.new(puzzle).calculate.position}"
puts "Following course submarine is in the aim position: #{Submarine.new(puzzle).calculate_aim.position}"