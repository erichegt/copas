class Player
  attr_reader :cards, :position, :cards_to_discard, :selected_card, :points
  
  def initialize(position)
    @position = Position.new(position)
    @points = 0
  end
  
  def to_s
    "(#{self.position}->#{self.points} points)"
  end
  
  def first?
    self.cards.include?(Card.starter)
  end
  
  def receive_first_hand(cards)
    @cards = cards
  end
  
  def add_points(points)
    @points+=points
  end
  
  def new_play_with_card(selected_card)
    raise StandardError unless self.cards.include?(selected_card)
    
    @cards.delete(selected_card)
    Play.new(self, selected_card)
  end
  
  def select_cards_to_discard(selected)
    raise StandardError unless selected.size == 3
    @cards -= selected
    @cards_to_discard = selected
  end
  
  def receive_cards_from(another_player)
    self.cards += another_player.cards_to_discard
    another_player.cards_to_discard.clear
  end
  

end