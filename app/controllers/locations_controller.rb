require 'http'
class LocationsController < ApplicationController
  def show
    id = params[:id].to_s
    data = JSON.parse HTTP.get('https://integracion-rick-morty-api.herokuapp.com/api/location/'+id)
    @location = data
    str = ""
    data["residents"].each do |resident|
      puts resident
      resident.gsub! 'https://integracion-rick-morty-api.herokuapp.com/api/character/', ''
      id_r = resident
      str = str + "," + id_r
    end
    residents_data = JSON.parse HTTP.get("https://integracion-rick-morty-api.herokuapp.com/api/character/"+str)
    @residents = residents_data
  end
end
