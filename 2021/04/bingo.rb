require 'board'
require 'score'

class Bingo
  def initialize(input)
    @numbers_to_play = []
    @boards = []
    @score = Score.new(self)
    @winning_board = nil

    if input
      split_by_new_lines = input.split("\n")
      @numbers_to_play = split_by_new_lines.shift.split(',').map(&:to_i)

      i = 0
      size = 5
      board = Board.new(size)

      split_by_new_lines.count.times do
        line = split_by_new_lines.shift
        next if line.empty?

        board.add_columns(line.split.map(&:to_i))

        i += 1
        if i == size
          i = 0
          @boards << board
          board = Board.new(size)
        end
      end

    end
  end

  def play(opts = { till_end: false })
    @numbers_to_play.each_with_index do |number|
      @boards.each do |board|
        result = board.mark_with(number)
        @winning_board = board if board.is_win? && result
        break if @winning_board && !opts[:till_end]
      end
      break if @winning_board && !opts[:till_end]
    end

    raise 'Game over. No winner' unless @winning_board
    self
  end

  def winning_board
    raise 'No winner board' unless @winning_board
    @winning_board
  end

  def score
    @score
  end

  def last_number
    @last_number
  end
end