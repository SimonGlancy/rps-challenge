class Game

attr_reader :rounds, :score

BEST_OF = 5

  def initialize(player1, player2, round_klass = Round)
    @round_klass = round_klass
    @rounds = []
    @player1 = player1
    @player2 = player2
    @score = {
               @player1.name.to_sym => 0,
               @player2.name.to_sym => 0
               }
  end

  def new_round
    @rounds << @round_klass.new(@player1, @player2)
  end

  def player1_play(choice)
    @rounds[-1].player1_turn(choice)
  end

  def player2_play
    @rounds[-1].player2_turn
  end

  def update_score
    @rounds[-1].winner != "Draw" ? @score[@rounds[-1].winner.to_sym] += 1 : nil
  end

  def game_over
    @score[@player1.name.to_sym] > BEST_OF/2 || @score[@player2.name.to_sym] > BEST_OF/2 ? true : false 
  end


end
