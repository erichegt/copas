class Play
  attr_reader :player, :card
  
  def initialize(player, card)
    @player = player
    @card = card
  end
  
  def to_s
    "#{player} -> #{card}"
  end
end