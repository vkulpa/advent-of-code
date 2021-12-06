class HydrothermalVent
  def initialize(input, debug = false)
    @coordinates = []
    @data = {}

    input.split("\n").each do |line|
      coordinates = line.split('->')
      x1, y1 = fetch_coordinates(coordinates[0])
      x2, y2 = fetch_coordinates(coordinates[1])

      @coordinates.push([x1, y1, x2, y2])
    end
  end

  def calculate
    @coordinates.each do |coordinate|
      x1, y1, x2, y2 = coordinate

      next unless (x1 == x2) || (y1 == y2)

      line = x1 == x2 ? :x : :y
      from, to = line == :x ? [y1, y2] : [x1, x2]
      from, to = [to, from] if to < from

      (from..to).each do |point|
        row, column = line == :x ? [point, x1] : [y1, point]
        set_data(row, column)
      end
    end

    self
  end

  def calculate_with_diagonals
    calculate
    @coordinates.each do |coordinate|
      x1, y1, x2, y2 = coordinate

      next if x1 == x2 || y1 == y2

      c, r = x1, y1
      # TODO: refactor it
      while true
        set_data(r, c)

        if x1 <= x2
          c += 1
          break if c > x2
        else
          c -= 1
          break if c < x2
        end

        if y1 <= y2
          r += 1
          break if r > y2
        else
          r -= 1
          break if r < y2
        end
      end
    end

    self
  end

  def total_overlap
    @data.values.map do |row|
      row.values.select do |column|
        column >= 2
      end.flatten
    end.flatten.count
  end

  private

  def fetch_coordinates(coordinates)
    coordinates.split(',').map(&:strip).map(&:to_i)
  end

  def set_data(row, column)
    @data[row] ||= {}
    @data[row][column] ||= 0
    @data[row][column] += 1
  end
end