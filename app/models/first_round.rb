class FirstRound < Round
  
  def initialize(player)
    raise '#{player} can\'t start the first round' unless player.first?
    
    super(player.new_play_with_card(Card.starter), 1)
  end
  
  def include_play(play)
    raise 'Invalid play for first round' unless play.card.can_appear_in_first_round?
    
    super(play)
  end
  
  def valid_cards_for_player(player)
    if (self.last_play?)
      super(player)
    else
      player.cards.select() do |card|
        card.can_appear_in_first_round?
      end
    end
  end
  
end