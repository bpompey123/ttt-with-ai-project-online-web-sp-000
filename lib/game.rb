class Game
  attr_reader :WIN_COMBINATIONS
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [2,4,6]
]

  def initialize(player_1 = Players::Human.new("X") , player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.find do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] &&
      @board.cells[combo[1]] == @board.cells[combo[2]] &&
      @board.taken?(combo[0]+1)
    end
  end

  def draw?
    !won? && @board.full?
  end

  def over?
    won? || @board.full? || draw?
  end

  def winner
    if won?
      return @board.cells[won?[0]]
    end
  end

  def movex(input, current_player)
    @board.valid_move?(input)? @board.update(input, current_player) : turn
  end

  def turn
    puts "Please enter 1-9:"
    input = current_player.move(input).to_i
    movex(input, current_player)
  end

  def play
    turn until over?
    if draw?
      puts "Cat's Game!"
    else
      puts "Congratulations #{winner}!"
    end
  end



end
