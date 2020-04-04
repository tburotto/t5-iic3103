require "http"

class ChaptersController < ApplicationController
  def index
    page = 'https://rickandmortyapi.com/api/episode'
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
    page = 'https://rickandmortyapi.com/api/episode/'+id.to_s
    data = JSON.parse HTTP.get(page)
    characters = ""
    data["characters"].each do |characterPage|
      id = characterPage.delete("https://rickandmortyapi.com/api/character/")
      characters = characters + ","+id
    end
    characters_data = JSON.parse HTTP.get("https://rickandmortyapi.com/api/character/"+characters)
    @characters = characters_data
    @episode = data

  end
end
