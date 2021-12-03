class Santa
  def initialize(path = '')
    @floor = 0
    @position = 0
    @path = path
  end

  def deliver
    @path.each_char do |direction|
      go(direction)
    end
    self
  end

  def deliver_to_basement
    @path.chars.each_with_index do |direction, position|
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