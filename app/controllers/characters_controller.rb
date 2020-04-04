class CharactersController < ApplicationController
  def index
  end

  def show
    id = params[:id].to_s
    data = JSON.parse HTTP.get('https://rickandmortyapi.com/api/character/'+id)
    @character = data 
    str = ""
    data["episode"].each do |episode|
      id_e = episode.delete("https://rickandmortyapi.com/api/episode/")
      str = str +","+id_e
    end
    episodes_data = JSON.parse HTTP.get("https://rickandmortyapi.com/api/episode/"+str)
    @episodes = episodes_data
  end
end
