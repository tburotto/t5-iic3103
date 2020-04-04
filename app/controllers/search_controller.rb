class SearchController < ApplicationController
  def show
    values = params["values"]
    @search = values
    str = values.gsub(" ","+")

    episodes_results = JSON.parse HTTP.get("https://rickandmortyapi.com/api/episode/?name="+str)
    if episodes_results["error"] == "There is nothing here"
      results_e = []
    else
      results_e = episodes_results["results"]
      while episodes_results["info"]["next"] != "" do
        page = episodes_results["info"]["next"] 
        episodes_results = JSON.parse HTTP.get(page)
        results_e = results_e + episodes_results["results"]
      end
    end
    @episodes = results_e

    characters_results = JSON.parse HTTP.get("https://rickandmortyapi.com/api/character/?name="+str)
    if characters_results["error"] == "There is nothing here"
      results_c = []
    else
      results_c = characters_results["results"]
      while characters_results["info"]["next"] != "" do
        page = characters_results["info"]["next"] 
        characters_results = JSON.parse HTTP.get(page)
        results_c = results_c + characters_results["results"]
      end
    end
    @characters = results_c

    locations_results = JSON.parse HTTP.get("https://rickandmortyapi.com/api/location/?name="+str)
    if locations_results["error"] == "There is nothing here"
      results_l = []
    else
      results_l = locations_results["results"]
      while locations_results["info"]["next"] != "" do
        page = locations_results["info"]["next"] 
        locations_results = JSON.parse HTTP.get(page)
        results_l = results_l + locations_results["results"]
      end
    end
    @locations = results_l
  end

end
