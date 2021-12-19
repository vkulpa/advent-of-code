class Board

  def initialize(size)
    @cells = []
    @numbers = {}
    @last_number = 0
    @size = size
    @win = false
  end

  def add_columns(columns)
    columns.each_with_index do |n, i|
      @numbers[n] = { row: @cells.count, column: i, visited: false }
    end

    @cells << columns
  end

  def is_win?
    @win ||= (visited(:column) || visited(:row))
  end

  def unvisited_cells
    @numbers.select do |_, n|
      !n[:visited]
    end.keys
  end

  def mark_with(number)
    return false if is_win?
    @last_number = number
    @numbers[number][:visited] = true if @numbers[number]
  end

  def last_number
    @last_number
  end

  private

  def visited_cells
    @numbers.select do |_, n|
      n[:visited]
    end
  end

  def visited(on = :row)
    visited_cells.group_by do |_, v|
      v[on]
    end.select do |_, v|
      v.count == @size
    end.any?
  end
end