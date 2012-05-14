class RoundResult
  attr_reader :winner, :round_points
  
  def initialize(winnner, round_points)
    @winner = winner
    @round_points = round_points
  end
  
  def to_s
    "#{self.winner} -> +#{self.round_points}"
  end
end
