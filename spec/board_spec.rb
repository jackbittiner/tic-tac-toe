require 'board'

describe Board do

  subject(:board) {described_class.new}

  describe 'initialize' do
    it 'is initialized with 9 cells' do
      expect(board.grid[8].content).to eq ""

    end
  end
end
