class Position
  @@all = [:north, :west, :south , :east]
  
  attr_reader :value
  
  def initialize(position)
    raise "Invalid Position: #{position}" unless @@all.include?(position)
    @value = position
  end
  
  def to_s
    "#{self.value}"
  end
  
  #clock wise
  def next
    Position.new(  @@all [ @@all.index(self.value)+1 ] || @@all.first )
  end
  
  def == (other)
    other.value == self.value
  end

end

