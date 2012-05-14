class Cache
  @@rooms = []

  
  def self.create_new_room()
    @@rooms << Room.new(Player.new(Position.new(:north)))
  end
  
  def self.enter_room(room_id)
    @@rooms.last.receive_player()
  end
  
  def self.avaliable
    @@rooms
  end
end