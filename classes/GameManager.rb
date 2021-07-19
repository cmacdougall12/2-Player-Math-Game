class GameManager
  def initialize()
    @active_player = 0
    @players = []
    @round = 0
  end

  def start_game
    puts "Let's see who is the best at math!"

    print "Player 1, enter your name: "
    player_1 = Player.new(gets.chomp)
    @players << player_1

    print "Player 2, enter your name: "
    player_2 = Player.new(gets.chomp)
    @players << player_2

    puts "Okay, #{player_1.name} and #{player_2.name}. Lets start, press any key to continue!"
    puts " "
    STDIN.getch                            
    print "            \r"
    run_game()
  end

  def turn_manager
    @active_player == 0 ? @active_player = 1 : @active_player = 0
  end

  def round_counter
    @round += 1
  end

  def end_game?
    if @players[0].score == 0 || @players[1].score == 0
      return true
    end
    false
  end

  def run_game
    while end_game? == false
      if @round != 0 
        puts "----- NEW TURN -----"
      end
      round_counter
      puts "Round #{@round}"
      question = Question.new()
      puts "#{@players[@active_player].name} what does #{question.question} equal?"
      answer = gets.chomp.to_i

      if answer == question.correct_answer
        puts "Correct #{@players[@active_player].name}!!!"
      else
        @players[@active_player].score -= 1
        puts "#{@players[@active_player].name} seriously!? No!"
      end
      puts "#{@players[0].name} has #{@players[0].score} of 3 lives left!"
      puts "#{@players[1].name} has #{@players[1].score} of 3 lives left!"
      puts "Press any key to continue"
      STDIN.getch 
      puts " "
      
      turn_manager  
    end
    puts "----- GAME OVER -----"
    if @players[0].score > @players[1].score
      puts "#{@players[0].name } wins with #{@players[0].score }/3 lives left!!!"
    else
      puts "#{@players[1].name } wins with #{@players[1].score }/3 lives left!!!"
    end
  end
end
