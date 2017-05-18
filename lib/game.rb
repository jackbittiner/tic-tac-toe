require_relative 'board'
require_relative 'player'

class Game

  attr_reader :board, :player_1, :player_2, :winner, :winning_combos

  def initialize
    @board = Board.new
    @player_1 = Player.new('X')
    @player_2 = Player.new('O')
    @turn_count = 0
    @winner = nil
    @winning_combos = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
  end


  def play_piece(cell_num)
    raise "This cell is already filled!" if self.board.grid[cell_num].content != ""
    if @turn_count.even?
      self.board.grid[cell_num].content = self.player_1.piece
    else
      self.board.grid[cell_num].content = self.player_2.piece
    end
    @turn_count += 1
  end

  def check_for_win
    self.winning_combos.each do |win|
      @winner = self.player_1.piece if win.all? { |num| self.board.grid[num].content == self.player_1.piece }
    end
  end

end
