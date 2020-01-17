class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    puts
  end

  def position(input)
    @cells[input.to_i - 1]
  end

  def full?
    @cells.find {|cell| cell == " "} ? false : true
  end

  def turn_count
    9 - @cells.select {|cell| cell == " "}.length
  end

  def taken?(position)
    @cells[position.to_i - 1] == "X" || @cells[position.to_i - 1] == "O" ? true : false
  end

  def valid_move?(input)
    if (1..9).include?(input.to_i)
      taken?(input) ? false : true
    elsif input == "reset"
      start
    else
      false
      puts
      puts "Invalid Move"
      puts
    end
  end

  def update(position, player)
    @cells[position.to_i - 1] = player.token
  end

end
