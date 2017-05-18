require 'game'

describe Game do

  subject(:game) {described_class.new}

  describe 'initialize' do
    it 'is initialized with a board' do
      expect(game.board.class).to eq Board
    end

    it 'initializes with a player_1 with an X piece' do
      expect(game.player_1.piece).to eq 'X'
    end
    it 'initializes with a player_2 with an O piece' do
      expect(game.player_2.piece).to eq 'O'
    end

  end
end