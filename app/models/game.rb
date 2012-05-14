class Game
  attr_reader :results, :current_round
  
  def initialize(players_in_positions)
    @players_in_positions = players_in_positions
    
    cards = Card.all.shuffle 
  
    @players_in_positions.each_value do |p|
      p.receive_first_hand(cards.slice!(0,13))
    end
    
    first_player = @players_in_positions.values.select {|p| p.first?}.first
    
    @current_round = FirstRound.new(first_player)
    @results = []
  end
  
  def show_current
    {:player => self.next_player, 
        :cards => @current_round.valid_cards_for_player(self.next_player), 
            :winning_card => @current_round.winning_card_so_far}
  end
  
  def include_play(play)
    raise 'Wrong user' unless play.player == self.next_player

    if (@current_round.ended?)
      @current_round = @current_round.start_next_round_with_play(play)
    else
      @current_round.include_play(play)
    end

    if (@current_round.ended?)
      results << RoundResult.new(@current_round.winner, @current_round.points)
    end
    
  end
  
  def ended?
    @current_round.ended? && @current_round.number == 4
  end

  def next_player
    @players_in_positions[@current_round.next_turn_player_position.value]
  end
  
end