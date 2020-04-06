class CharactersController < ApplicationController
  def index
  end

  def show
    id = params[:id].to_s
    data = JSON.parse HTTP.get('https://integracion-rick-morty-api.herokuapp.com/api/character/'+id)
    @character = data 
    str = ""
    data["episode"].each do |episode|
      episode.gsub! 'https://integracion-rick-morty-api.herokuapp.com/api/episode/', ''
      id_e = episode
      str = str +","+id_e
    end
    episodes_data = JSON.parse HTTP.get("https://integracion-rick-morty-api.herokuapp.com/api/episode/"+str)
    @episodes = episodes_data
  end
end
