class Round
  attr_reader :winner, :next_turn_player_position, :number, :cards, :winning_card_so_far
    
  def initialize(play, number)    
    @winning_card_so_far = play.card
    @winner_so_far = play.player
    @who_played = [play.player]
    @cards = [play.card]
    @next_turn_player_position = play.player.position.next
    @number = number
  end
  
  def include_play(play)
    raise "#{play.player} already played" if @who_played.include?(play.player)
    raise 'Round has ended' if self.ended?
    
    unless ( @winning_card_so_far.beats(play.card) )
      @winning_card_so_far = play.card
      @winner_so_far = play.player
    end
    
    @cards << play.card
    @who_played << play.player
    
    if (self.ended?)
      @winner = @winner_so_far
      @winner.add_points(self.points)
      @next_turn_player_position = @winner.position
    else 
      @next_turn_player_position = play.player.position.next      
    end
    
    self.ended?
  end
  
  def last_play?
    @who_played.size == 3
  end
  
  def ended?
    @who_played.size == 4 
  end
  
  def valid_cards_for_player(player)
    player.cards.select do |card|
      @who_played.size >= 1 || card.can_start_round?
    end
  end
  
  def points
    @cards.inject(0) { |sum, card| sum + card.points }
  end
  
  def start_next_round_with_play(play)
    raise 'Invalid start play' unless self.ended? && play.card.can_start_round? && play.player == self.winner
    
    if (self.number <=3)
      Round.new(play, self.number+1)
    else
      nil
    end
  end
  
end