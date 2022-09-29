class ApplicationController < Sinatra::Base

  set :default_content_type, 'application/json'
  # add routes
  get '/' do
    { message: "Hello world" }.to_json
  end

  get '/bakeries' do
    bakeries = Bakery.all
    # send them back as a JSON array
    bakeries.to_json
  end

  get '/bakeries/:id' do
    bakery = Bakery.find(params[:id])
    # send them back as a JSON array
    bakery.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
    goods = BakedGood.order(price: :desc)
    # send them back as a JSON array
    goods.to_json
  end

  get '/baked_goods/most_expensive' do
    best = BakedGood.order(price: :desc).first
    # send them back as a JSON array
    best.to_json
  end

  

end
