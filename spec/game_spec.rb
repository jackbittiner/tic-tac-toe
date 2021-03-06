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

  describe 'play_piece' do
    it 'changes a chosen cell to player 1s piece' do
      game.play_piece(0)
      expect(game.board.grid[0].content).to eq 'X'
    end

    it 'changes a chosen cell to player 2s piece after player 1 has done so' do
      game.play_piece(0)
      game.play_piece(1)
      expect(game.board.grid[1].content).to eq 'O'
    end

    it 'a piece cannot be placed on a cell that has already been placed on' do
      game.play_piece(0)
      expect{game.play_piece(0)}.to raise_error "This cell is already filled!"
    end
  end

  describe 'check_for_win' do
    it 'assigns player 1 the winner if they get three in a row' do
      game.play_piece(0)
      game.play_piece(8)
      game.play_piece(1)
      game.play_piece(7)
      game.play_piece(2)
      game.check_for_win
      expect(game.winner).to eq 'X'
    end

    it 'assigns player 2 the winner if they get three in a row' do
      game.play_piece(1)
      game.play_piece(0)
      game.play_piece(7)
      game.play_piece(8)
      game.play_piece(2)
      game.play_piece(4)
      game.check_for_win
      expect(game.winner).to eq 'O'
    end
  end

  describe 'game_over' do

    it 'is game over when all cells are filled' do
      (1..8).each {|num| game.play_piece(num)}
      expect(game.game_over).to be_truthy
    end

    it 'is game over when someone wins' do
      game.play_piece(0)
      game.play_piece(8)
      game.play_piece(1)
      game.play_piece(7)
      game.play_piece(2)
      expect(game.game_over).to be_truthy
    end
  end
end
