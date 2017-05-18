require 'game'

describe Game do

  subject(:game) {described_class.new}

  describe 'initialize' do
    it 'is initialized with a board' do
      expect(game.board.class).to eq Board

    end
  end
end
