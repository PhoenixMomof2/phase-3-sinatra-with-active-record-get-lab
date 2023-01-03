class ApplicationController < Sinatra::Base

    get '/bakeries' do
      # get all the bakeries from the database
      bakeries = Bakery.all
      # send them back as a JSON array
      bakeries.to_json
    end
end
