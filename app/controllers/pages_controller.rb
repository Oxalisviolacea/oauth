class PagesController < ApplicationController
  before_action :ensure_logged_in, only: [:private]
  
  def home
  end

  def private
    username = current_user.name

    conn = Faraday.new(url: "https://api.github.com")

    response = conn.get("/user/repos?access_token=3da22d0c5930f4ca2e0bf2d5701e4b5bcad45d9c")

    json = JSON.parse(response.body, symbolize_names: true)
    @repos = json
  end
end