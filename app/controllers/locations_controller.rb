require 'http'
class LocationsController < ApplicationController
  def show
    id = params[:id].to_s
    data = JSON.parse HTTP.get('https://rickandmortyapi.com/api/location/'+id)
    @location = data
    str = ""
    data["residents"].each do |resident|
      id_r = resident.delete("https://rickandmortyapi.com/api/character")
      str = str + "," + id_r
    end
    residents_data = JSON.parse HTTP.get("https://rickandmortyapi.com/api/character/"+str)
    @residents = residents_data
  end
end
