class FoodsController < ApplicationController
  def index

    conn = Faraday.new(url: "https://api.nal.usda.gov")

    response = conn.get("/fdc/v1/search?api_key=MLnzkOtHdX2p98vw3SDTiyTXAqSctp5I6S0pMnlk&generalSearchInput=sweet%20potatoes")

    @foods = JSON.parse(response.body, symbolize_names: true)[:foods].first(10)

  end
end
