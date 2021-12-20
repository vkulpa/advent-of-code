require 'crab'

class CrabContainer
  def initialize(input)
    @crabs = []
    @positions = {}
    @min = 4294967295
    @max = -1

    positions = input.split(',').map(&:to_i)
    positions.each do |position|
      @min = position if position < @min
      @max = position if @max < position
      @crabs << Crab.new(position)
    end
  end

  def align(variable_fuel: false)
    (@min..@max).each do |position|
      @crabs.each do |crab|
        crab.align_to(position)
      end
      @positions[position] = @crabs.map { |c| c.send(variable_fuel ? :fuel_variable : :fuel) }.sum
    end

    self
  end

  def total_fuel
    most_efficient = 4294967295
    @positions.select do |position, total_fuel|
      most_efficient = total_fuel if total_fuel < most_efficient
    end
    most_efficient
  end
end