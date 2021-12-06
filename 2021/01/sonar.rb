class Sonar
  def initialize(input)
    @data = input.split("\n").map(&:to_i)
    @total = 0
  end

  def calculate
    @data.each_with_index do |m, i|
      @total += 1 if m < @data[i + 1].to_i
    end
    self
  end

  def calculate_skip_noise
    (3...@data.count).each do |i|
      @total += 1 if @data[i - 3] < @data[i]
    end
    self
  end

  def total
    @total
  end
end