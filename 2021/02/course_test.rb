#!/usr/bin/env ruby

basedir = File.dirname(File.expand_path(__FILE__))
$: << basedir
$: << File.expand_path('../..', basedir)
require 'assert'
require 'submarine'

INPUT = <<IPT
forward 5
down 5
forward 8
up 3
down 8
forward 2
IPT

puzzle = File.read("#{basedir}/input.txt")

assert_equal "Submarine position is wrong", Submarine.new(INPUT).calculate.position, 150
assert_equal "Submarine position is wrong", Submarine.new(puzzle).calculate.position, 1728414

assert_equal "Submarine position is wrong", Submarine.new(INPUT).calculate_aim.position, 900
assert_equal "Submarine position is wrong", Submarine.new(puzzle).calculate_aim.position, 1765720035

puts "Submarine followed the course" unless failed?