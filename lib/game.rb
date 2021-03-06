class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
     @board.turn_count.even? ? @player_1 : @player_2
  end

  def won?
    WIN_COMBINATIONS.find do |win_combo|
      if @board.cells[win_combo[0]] != " " && @board.cells[win_combo[0]] == @board.cells[win_combo[1]] && @board.cells[win_combo[1]] == @board.cells[win_combo[2]]
        win_combo
      else
        false
      end
    end
  end

  def draw?
    @board.full? && !won? ? true : false
  end

  def over?
    true if draw? || won?
  end

  def winner
    if won?
      board.cells[won?[1]] if board.cells[won?[1]] != " "
    else
      nil
    end
  end

  def turn
    move = current_player.move(board)
    @board.valid_move?(move) ? @board.update(move, current_player) : turn
  end

  def play
    while !over? do
      self.turn
      sleep (0.5)
      @board.display
    end
    puts "Congratulations #{winner}!" if won?
    puts "Cat's Game!" if draw?
  end

end
