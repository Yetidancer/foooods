class FoodsController < ApplicationController
  def index

    conn = Faraday.new(url: "https://api.nal.usda.gov")

    response = conn.get("/fdc/v1/search?api_key=#{ENV["FDC_API_KEY"]}&generalSearchInput=sweet%20potatoes")

    @foods = JSON.parse(response.body, symbolize_names: true)[:foods].first(10)

  end
end
