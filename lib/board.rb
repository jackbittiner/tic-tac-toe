require_relative 'cell'

class Board

  attr_reader :grid, :winning_combos

  def initialize
    @grid = []
    9.times { @grid << Cell.new }
    @winning_combos = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6],
                      [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
  end
end
