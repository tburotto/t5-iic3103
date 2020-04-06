require "http"

class ChaptersController < ApplicationController
  def index
    page = 'https://integracion-rick-morty-api.herokuapp.com/api/episode'
    data = JSON.parse HTTP.get(page)
    page = data['info']['next']
    result = data["results"]
    while page != "" do
      data = JSON.parse HTTP.get(page)
      page =  data['info']['next']
      result = result + data["results"]
    end
    @chapters = result
  end

  def show
    id = params[:id]
    page = 'https://integracion-rick-morty-api.herokuapp.com/api/episode/'+id.to_s
    data = JSON.parse HTTP.get(page)
    characters = ""
    data["characters"].each do |characterPage|
      characterPage.gsub! 'https://integracion-rick-morty-api.herokuapp.com/api/character/', ''
      id = characterPage
      characters = characters + ","+id
      puts characterPage

    end
    characters_data = JSON.parse HTTP.get("https://integracion-rick-morty-api.herokuapp.com/api/character/"+characters)
    @characters = characters_data
    @episode = data

  end
end
