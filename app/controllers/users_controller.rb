class UsersController < ApplicationController

  get '/signup' do
  	if !session[:user_id]
  	  erb :'users/create_user', locals: {message: "Please signup before you sign in"}
  	else
  	  redirect to '/notes'
  	end
  end

  # Create a new user
  post '/signup' do
  	if params[:username] == "" || params[:password] == ""
  	  redirect to '/signup'
  	else
  	  @user = User.create(username: params[:username], password: params[:password])
  	  session[:user_id] = @user.id
  	  redirect to '/notes'
  	end
  end

  get '/login' do
  	if !session[:user_id]
  	  erb :'users/login'
  	else
  	  redirect '/notes'
  	end
  end

  post '/login' do
  	user = User.find_by(username: params[:username])
  	if user && user.authenticate(params[:password])
  	  session[:user_id] = user.id
  	  redirect '/notes'
  	else
  	  redirect to '/signup'
  	end
  end


  get '/logout' do
  	if session[:user_id] != nil
  	  session.destroy
  	  redirect to '/login'
  	else
  	  redirect to '/'
  	end
  end

end