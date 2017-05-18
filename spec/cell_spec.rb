require 'cell'

describe Cell do

  subject(:cell) {described_class.new}

  describe 'initialize' do
    it 'is initialized with no value' do
      expect(cell.value).to eq ""

    end
  end
end
