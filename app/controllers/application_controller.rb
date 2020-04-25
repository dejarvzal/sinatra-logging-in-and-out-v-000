require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions #unless test?
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

  post '/login' do
<<<<<<< HEAD

    @user = User.find_by(:username => params[:username])
  # binding.pry
    # session[:user_id] = @user.id  #once the username is found, set the session id for the userid for that username.
      if @user != nil && @user.password == params[:password] #if the user has a value
      # @user.username == session[:username]
      session[:user_id] = @user.id
        redirect to "/account"
      end
      erb :error
  end

  get '/account' do
      @user = Helpers.current_user(session)
      if @user
        # session[:user_id] = @user.id
        erb :account
      else
        erb :error
      end
=======
    binding.pry
    @user = User.find_by(:username => params[:username]) #not sure how to read this, where is the data coming from?   ?Find a user by the username entered by user which is captured into params??
    # session[:user_id] = @user.id  #once the username is found, set the session id for the userid for that username.
      if @user.id != nil  #if the user has a value
      # @user.username == session[:username]
      session[:user_id] = @user.id
        redirect "/account"
      else
      #incorrect password
      redirect '/login'
      end
# redirect to '/login'
  end

  get '/account' do
    erb :account
>>>>>>> d78add487b67220da793137e62834deed310d1a3
  end

  get '/logout' do
    session.clear
    redirect to '/'
  end

end
