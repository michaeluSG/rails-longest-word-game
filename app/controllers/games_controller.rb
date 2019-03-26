require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = []
    10.times do
      @letters << ("A".."Z").to_a.sample
    end
  end

  def score
    url = "https://wagon-dictionary.herokuapp.com/#{params[:word]}"
    user_serialized = open(url).read
    array = JSON.parse(user_serialized)
    if array[:found] == "false"
      @answer = "sorry but #{params[:word]} does not exist"
    # elsif array[:found] == false && exist? == false
    #   @answer = "sorry but #{params[:word]} does not exist and is not included in the grid"
    # elsif array[:found] == true && exist? == false
    #   @answer = "sorry but #{params[:word]} is not included within the grid"
    else
      @answer = 'well done'
    end
  end

  def exist?
    params[:letters].count
    params[:word].split("").count
  end
end
