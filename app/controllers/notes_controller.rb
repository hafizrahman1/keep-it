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
	end
	
end