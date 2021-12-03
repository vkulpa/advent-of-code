class Santa
  def initialize(path = '')
    @floor = 0
    @position = 0
    @paths = path.chars
  end

  def deliver
    @paths.each do |direction|
      go(direction)
    end
    self
  end

  def deliver_to_basement
    @paths.each_with_index do |direction, position|
      go(direction)

      if @floor == -1
        @position = position + 1
        break
      end
    end
    self
  end

  def floor
    @floor
  end

  def position
    @position
  end

  private

  def go(direction)
    @floor += (direction.eql?('(') ? 1 : -1)
  end
end