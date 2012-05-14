class Position
  @@all = [:north, :west, :south , :east]
  
  attr_reader :value
  
  def initialize(position)
    raise "Invalid Position: #{position}" unless @@all.include?(position.to_sym)
    @value = position.to_sym
  end
  
  def to_s
    "#{self.value}"
  end
  
  #clock wise
  def next
    Position.new(  @@all [ @@all.index(self.value)+1 ] || @@all.first )
  end
  
  def to_sym
    self.value
  end
  
  def == (other)
    other.value == self.value
  end
  
  def as_json(options={})
    {:position => self.value}
  end

end

