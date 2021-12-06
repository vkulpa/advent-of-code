#!/usr/bin/env ruby

require './santa'

puts "Following instructions Santa delivered gifts to floor: #{Santa.new(File.read('./input.txt').strip).deliver.floor}"
puts "Following instructions Santa delivered gifts to basement on position: #{Santa.new(File.read('./input.txt').strip).deliver_to_basement.position}"