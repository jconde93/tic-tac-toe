require_relative './control_helper'

player1 = Player.new("X")
player2 = Player.new("O")
board = Board.new


def input x

  cord = x.to_s.chomp.split(/\D+/)

  while cord.size != 2
    puts "Input Error: try x,y"
    cord = gets.chomp.split(/\D+/)
  end

  while !cord[0].to_i.between?(1,3) or !cord[1].to_i.between?(1,3)
    puts "Cordinates have to be between 1 and 3"
    cord = gets.chomp.split(/\D+/)
  end


  cord[0] = cord[0].to_i - 1
  cord[1] = cord[1].to_i - 1

  return cord.to_a
end

def change player, player1, player2
  if player == player1
    return player2
  else
    return player1
  end
end

def play player1, player2, board

  player_turn = player1

  while !player1.win?(board) and !player2.win?(board) and !board.full?
    system('cls') or system('clear')

    puts "----------Tic-Tac-Toe------------"
    puts

    board.display

    puts "\n#{player_turn == player1 ? "Player 1" : "Player 2"} (#{player_turn.piece})"
    puts "Enter a position to play (x,y): "

    cord = input(gets)

    while !board.edit(cord[1],cord[0],player_turn)
      puts "That space is taken, try again"
      cord = input(gets)
    end

    player_turn = change player_turn, player1, player2
  end

  if board.full? and !player1.win?(board) and !player2.win?(board)
    puts "\nIt's a tie"
  else
    puts "\nPlayer #{player1.win?(board) ? "Player 1" : "Player 2"} won!"
  end

  return nil
end

play player1, player2, board
