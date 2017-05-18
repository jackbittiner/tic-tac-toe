require_relative 'board'
require_relative 'player'

class Game

  attr_reader :board, :player_1, :player_2

  def initialize
    @board = Board.new
    @player_1 = Player.new('X')
    @player_2 = Player.new('O')
  end

  def play_piece(cell_num)
    self.board.grid[cell_num].content = self.player_1.piece
  end

end
