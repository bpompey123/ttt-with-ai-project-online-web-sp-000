class Board

  attr_accessor :cells
 
  def initialize
    reset!
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(user_input)
    cells[user_input.to_i - 1]
  end

  def full?
    cells.all? do |full_board|
      full_board == "X" || full_board == "O"
    end
  end

  def turn_count
    cells.count{|token| token == "X" || token == "O"}
  end

  def taken?(index)
    if position(index) == " " || position(index) == "" || position(index) == nil
      return false
    else
      return true

    end
  end

  def valid_move?(input)
    input = input.to_i
    !(taken?(input)) && input.between?(1, 9)
  end

  def update(input, player)
    input = input.to_i
    cells[input - 1] = player.token
  end
end
