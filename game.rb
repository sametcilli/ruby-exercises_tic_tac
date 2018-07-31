class Game
    require_relative './area'
    def initialize
        @player = [{:name=>'',:symbol=>''},{:name=>'',:symbol=>''}]
        @area = Area.new
        @area.draw
    end
    def get_player_info
        player1 = ''
        player2 = ''
        player1_symbol = ''
        player2_symbol = ''
        until player1 != ''
            puts "1. Player name : "
            player1 = gets.chomp.to_s
        end
        until player2 != '' && player1 != player2
            puts "2. Player name: "
            player2 = gets.chomp.to_s
        end
        until player1_symbol != ''
            puts "enter symbol for " + player1 + ":"
            player1_symbol = gets.chomp.to_s
        end
        
        until player2_symbol != '' && player2_symbol != player1_symbol
            puts "enter symbol for " + player2 + ":"
            player2_symbol = gets.chomp.to_s
        end
        player1(player1, player1_symbol)
        player2(player2, player2_symbol)
    end
    
    def player1(playerName, playerSymbol)
        @player[0] = { :name => playerName, :symbol => playerSymbol }
    end
    def player2(playerName, playerSymbol)
        @player[1] = { :name => playerName, :symbol => playerSymbol }
    end

    def play
        get_player_info
        player_index = [0,1].sample
        move = 0
        moving = true
        while moving
            player = @player.fetch(player_index)
            puts player[:name] + "("+player[:symbol]+") is playing: "
            move = gets.chomp.to_i
            puts "move:"+move.to_s
            status = @area.value(move, player[:symbol])
            if(status == true)
                case player_index
                    when 1
                        player_index = 0
                    else
                        player_index = 1
                end
                if @area.check_win(player[:symbol]) == true
                    puts player[:name] + "("+player[:symbol]+") won!"
                    moving = false
                end
                if @area.check_finishing == false
                    puts "oyun bitti."
                    moving = false
                end
            end
        end
    end
end