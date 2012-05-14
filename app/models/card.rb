class Card
  @@all_suits = {:spades => 0, :hearts => 1, :diamonds => 0, :clubs => 0}
  @@all_numbers = [:two, :three , :four, :five, :six, :seven, :eight, :nine, :ten, :jack, :queen, :king, :ace]
  
  attr_reader :suit, :number

  def initialize(number, suit)
    raise InvalidCardError unless @@all_suits.has_key?(suit) && @@all_numbers.include?(number)
    @suit = suit
    @number = number
  end
  
  def self.starter
    Card.new(:two, :clubs)
  end
  
  def can_start_round?
    self.suit != :hearts #e se o cara soh tiver copas?
  end
  
  def can_appear_in_first_round?
    self.suit != :hearts && self != Card.new(:queen, :spades)
  end
  
  def == other
    self.suit == other.suit && self.number == other.number
  end
  
  def to_s
    "#{self.number} of #{self.suit}"
  end
  
  def points
    if (self.suit == :spades && self.number == :queen)
      return 13
    end
    @@all_suits[self.suit]
  end
  
  def beats(other_card)
    self.suit != other_card.suit || @@all_numbers.index(self.number) > @@all_numbers.index(other_card.number)
  end
  
  def self.all
    @@all_suits.keys.product( @@all_numbers ).collect do |suit, number|
      Card.new(number, suit)
    end
  end  
end


class InvalidCardError < StandardError; end