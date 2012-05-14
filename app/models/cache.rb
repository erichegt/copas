

class Cache
  @@rooms = []
    
  def self.create_new_room()
    @@rooms << Room.new(Player.new(Position.new(:north)) )
  end
  
  def self.enter_room(room_id)
    if (@@rooms.last.full?)
      @@rooms << Room.new(Player.new(Position.new(:north)) )
    else
      position = @@rooms.last.players.last.position.next
      @@rooms.last.receive_player(Player.new(position))
    end
  end
  
  def self.avaliable
    @@rooms
  end
end