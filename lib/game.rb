require_relative 'board'
require_relative 'player'

class Game

  attr_reader :board, :player_1, :player_2

  def initialize
    @board = Board.new
    @player_1 = Player.new('X')
    @player_2 = Player.new('O')
    @turn_count = 0
  end

  def play_piece(cell_num)
    if @turn_count.even?
      self.board.grid[cell_num].content = self.player_1.piece
    else
      self.board.grid[cell_num].content = self.player_2.piece
    end
    @turn_count += 1
  end

end
