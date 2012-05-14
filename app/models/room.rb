class Room
  
  def initialize(player)
    @players_in_position = {player.position.value => player}
  end
  
  def full?
    @players_in_position.size == 4
  end
  
  def receive_player(player)
    @players_in_position.store(player.position.value, player)
    
    #     if (@players_in_position.empty?)
    #       @players_in_position.store( :north, Player.new(Position.new(:north)) )
    #     else 
    #       position = @players_in_position.values.last.position.next
    #       @players_in_position.store(position.value , Player.new(position) )
    #     end
  end
  
  def start_game
    raise 'Room not full' unless self.full?
    
    Game.new(@players_in_position)
  end
  
  def players
    @players_in_position.values
  end
  
end