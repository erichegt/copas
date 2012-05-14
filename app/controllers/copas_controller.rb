class CopasController < ApplicationController
  respond_to :json
  
  def mostra_salas
    respond_with(Cache.avaliable)
  end
  
  def entra_na_sala
    room_id = params[:id].to_i
    
    if (Cache.avaliable.empty?)
      Cache.create_new_room()
    else
      Cache.enter_room(room_id)
    end
    
    respond_with(Cache.avaliable)
  end
  
  
end