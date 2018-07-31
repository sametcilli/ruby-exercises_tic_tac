class Area
    def initialize 
        @game_values = Array.new(10, ' ')
    end
    def display 
        str = "----------------------------------------------------\n"
        str = str + "----------| " + @game_values.fetch(7, ' ') + " | " + @game_values.fetch(8, ' ') + " | " + @game_values.fetch(9, ' ') + " | -------------- | 7 | 8 | 9 |\n"
        str = str + "----------------------------------------------------\n"
        str = str + "----------| " + @game_values.fetch(4, ' ') + " | " + @game_values.fetch(5, ' ') + " | " + @game_values.fetch(6, ' ') + " | -------------- | 4 | 5 | 6 |\n"
        str = str + "----------------------------------------------------\n"
        str = str + "----------| " + @game_values.fetch(1, ' ') + " | " + @game_values.fetch(2, ' ') + " | " + @game_values.fetch(3, ' ') + " | -------------- | 1 | 2 | 3 |\n"
        str = str + "----------------------------------------------------\n"
        str
    end
    def check_finishing
        return @game_values[1..9].any?{|a| a==' '}
    end
    def check_win(sym)
        s = @game_values.map.with_index{|a,k| a==sym ? k : nil}.to_a
        return true if s & (1..3).to_a == (1..3).to_a
        return true if s & (4..6).to_a == (4..6).to_a
        return true if s & (7..9).to_a == (7..9).to_a
        return true if s & [1,4,7] == [1,4,7]
        return true if s & [2,5,8] == [2,5,8]
        return true if s & [3,6,9] == [3,6,9]
        return true if s & [1,5,9] == [1,5,9]
        return true if s & [7,5,3] == [7,5,3]
        return false
    end
    def value(t, char)
        unless (1..9).to_a.include?(t) 
            return false
        end
        if @game_values[t] != ''
            puts 'Oynadı'
            @game_values[t] = char
            reload
            return true
        else
            reload
            puts 'Hata tekarr!'
            return false
        end
    end
    def reload
        system "cls" or system 'clear'
        puts display
    end
    def draw
        puts display
    end
end