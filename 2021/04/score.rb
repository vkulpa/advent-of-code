class Score

  def initialize(bingo)
    @bingo = bingo
  end

  def calculate
    @bingo.winning_board.unvisited_cells.sum * @bingo.winning_board.last_number
  end
end