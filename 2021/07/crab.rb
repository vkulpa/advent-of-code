class Crab
  def initialize(position)
    @initial = position
    @position = 0
  end

  def align_to(position)
    @position = position
  end

  def fuel
    (@initial - @position).abs
  end

  def fuel_variable
    total = fuel
    ((total / 2.0) * (total + 1)).to_i
  end
end