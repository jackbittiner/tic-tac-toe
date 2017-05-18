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
  end


  def play_piece(cell_num)
    raise "This cell is already filled!" if self.board.grid[cell_num].content != ""
    change_specified_cell(cell_num)
    check_for_win
    @turn_count += 1
  end

  def check_for_win
    self.board.winning_combos.each do |win|
      @winner = self.player_1.piece if win.all? { |num| self.board.grid[num].content == self.player_1.piece }
      @winner = self.player_2.piece if win.all? { |num| self.board.grid[num].content == self.player_2.piece }
    end
  end

  def change_specified_cell(cell_num)
    if @turn_count.even?
      self.board.grid[cell_num].content = self.player_1.piece
    else
      self.board.grid[cell_num].content = self.player_2.piece
    end
  end

  def game_over
    self.winner || self.turn_count > 8
  end

end
