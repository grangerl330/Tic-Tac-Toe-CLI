class Players

  class Computer < Player
    attr_accessor :board

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

    CORNERS = [0,2,6,8]

    def block_or_win
      row_to_block = WIN_COMBINATIONS.find do |combo|
        if @board.cells[combo[0]] != " "
          (@board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[2]] == " ") || (@board.cells[combo[1]] == @board.cells[combo[2]] && @board.cells[combo[0]] == " ") || (@board.cells[combo[0]] == @board.cells[combo[2]] && @board.cells[combo[1]] == " ")
        else
          nil
        end
      end

      if row_to_block != nil
        cell_to_block = row_to_block.find {|cell| @board.cells[cell] == " "}
      end
    end

    def corner
      CORNERS.find {|corner| @board.cells[corner] == " "}
    end

    def center
      @board.cells[4] == " "
    end

    def move(board)
      @board = board

        if block_or_win != nil
          output = block_or_win + 1
        elsif center
          output = 5
        elsif corner != nil
          output = corner + 1
        else
          output = rand(1..9)
        end

        output.to_s
    end
  end
end
