require_relative 'cell'

class Board

  attr_reader :grid

  def initialize
    @grid = []
    9.times { @grid << Cell.new }
  end

end
