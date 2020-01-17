class Players

  class Human < Player

    def move(board)
      puts "Please enter your move as a number 1-9"
      user_input = gets.strip
      user_input
    end

  end

end