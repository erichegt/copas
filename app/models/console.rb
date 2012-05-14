class Console
  def initialize()
    
    players = [Player.new(:north), Player.new(:south), Player.new(:east), Player.new(:west)]

    room = Room.new(players.pop)            

    players.each do |player|
      room.receive_player(player)
    end
    
    @game = room.start_game
  end
  
  def start
    while ( !@game.ended? )
      cards = @game.show_current[:cards]
      player = @game.show_current[:player]
      winning_card =  @game.show_current[:winning_card] 
      
      puts "\n\n-----------------------------------------------------------------"
      puts "Resultados ate o momento: #{@game.results}"
      puts "Carta dominando o round: #{winning_card} -> Todas: #{@game.current_round.cards}" 
      puts "-----------------------------------------------------------------"
      puts "Faca sua escolha: #{player}"
      puts "Todas cartas: #{player.cards}"
      
      cards.each_with_index do |c, index|
        puts "#{index} - #{c}"
      end
      
      escolhida = cards[gets.chomp.to_i]
      play = player.new_play_with_card(escolhida)
      
      @game.include_play(play) 
    end
  end
  
end