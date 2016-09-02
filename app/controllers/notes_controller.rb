class NotesController < ApplicationController
	
	get '/notes' do 
	  if session[:user_id]
	  	@notes = Note.all
	  	erb :'notes/notes'
	  else
	  	redirect to '/login'
	  end
	end

	get '/notes/new' do
	 if logged_in?
	   erb :"notes/create_note"
	 else
	   redirect to '/login'
	 end
	end

	post '/notes' do

	  if params[:topic] == "" || params[:content] == ""
	    redirect to '/notes/new'
	  else
	  	@note = Note.create(content: params[:content], user_id: current_user.id)
	  	#@topic= Topic.create(name: params[:topic])
	    #@note.topics.build(name: params[:topic])
	    if !params[:topic].empty?
	  	  @note.topics << Topic.find_or_create_by(name: params[:topic])
	  	end

	  	redirect to "/users/#{current_user.id}"
	  end
	end

	get '/notes/:id/edit' do
	  	@note = Note.find_by_id(params[:id])
	  	if logged_in? && @note.user_id == session[:user_id]
	  	  erb :'/notes/edit_note'
	  	else
	  	  redirect to '/login'
	  	end
	end
	get	'/notes/:id/delete' do
	  @note = Note.find_by_id(params[:id])
	  if logged_in?
	    @note.delete
	    redirect to "/users/#{current_user.id}"
	  else
	    redirect to '/login'
	  end
	end

	patch '/notes/:id' do

      @note = Note.find_by_id(params[:id])
      @note.update(content: params[:note][:content])
      @note.topic_ids = params[:note][:topic_ids]


      if !params[:topic][:name].empty?
      	@topic = Topic.find_or_create_by(name: params[:topic][:name])
      	@note.topics<< @topic

      end
      @note.save
      redirect to "/users/#{current_user.id}"
    end

    delete '/notes/:id/delete' do 
	  @note = Note.find_by_id(params[:id])
	    if logged_in?
	      @note.delete
	      redirect to "/users/#{current_user.id}"
	    else
	      redirect to '/login'
	    end
    end
  
end