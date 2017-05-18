require 'player'

describe Player do

  subject(:player) {described_class.new('X')}

  describe 'initialize' do
    it 'is initialized with an X piece' do
      expect(player.piece).to eq "X"
    end
  end
end
