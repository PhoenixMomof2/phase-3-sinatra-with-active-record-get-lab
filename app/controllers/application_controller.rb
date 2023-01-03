class ApplicationController < Sinatra::Base

  # Add this line to set the Content-Type header for all responses
  set :default_content_type, 'application/json'

    get '/bakeries' do
      # get all the bakeries from the database
      bakeries = Bakery.all
      # send them back as a JSON array
      bakeries.to_json
    end

    get '/bakeries/:id' do
      bakery = Bakery.find_by(params[:id])
      bakery.to_json(include: :baked_goods)
    end

    get '/baked_goods/by_price' do
      baked_goods = BakedGood.all.order(price: :desc)
      baked_goods.to_json
    end

    get '/baked_goods/most_expensive' do
      baked_goods = BakedGood.all.order(price: :desc).first
      baked_goods.to_json
    end
end
