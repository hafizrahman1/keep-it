class TopicsController < ApplicationController

  get '/topics/:id' do
  	@topic = Topic.find_by_id(params[:id])
    erb :"topics/show" 
  end
end