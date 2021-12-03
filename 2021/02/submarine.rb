class Submarine
  def initialize(course)
    @courses = course.split("\n").map(&:strip)
    @horizontal = 0
    @depth = 0
    @aim = 0
  end

  def calculate
    @courses.each do |course|
      direction, unit = course.split
      if direction.eql?('forward')
        @horizontal += unit.to_i
      else
        @depth += (unit.to_i * (direction.eql?('up') ? -1 : 1))
      end
    end
    self
  end

  def calculate_aim
    @courses.each do |command|
      direction, unit = command.split
      if direction.eql?('forward')
        @horizontal += unit.to_i
        @depth += (@aim * unit.to_i)
      else
        @aim += (unit.to_i * (direction.eql?('up') ? -1 : 1))
      end
    end
    self
  end

  def position
    @horizontal * @depth
  end
end