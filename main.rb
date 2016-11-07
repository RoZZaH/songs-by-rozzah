require 'sinatra'
require 'sinatra/reloader'
require 'slim'
require 'sass'

configure do
  enable :sessions
  set :username, 'frank'
  set :password, 'sinatra'
end

get '/login' do
  slim :login
end


post '/login' do
  if params[:username] == settings.username && params[:password] == settings.password
  	session[:admin] = true
  	redirect to('/songs')
  else
  	slim :login
  end
end

get '/logout' do
  session.clear
  redirect to('/login')
end

=begin
 test route handler for session cookies	

get '/set/:name' do
  session[:name] = params[:name]
end

get '/get/hello' do
	"Hello #{session[:name]}"
end


=end	




require './song'



 #set :public_folder, 'assets'
 #set :views, 'templates'


get('/styles.css'){ scss :styles }

get '/' do
  slim :home #home view
end

get '/about' do
	@title = "All About This Website"
	slim :about
end

get '/contact' do
	slim :contact #, :layout => :special
end

not_found do
  slim :not_found
end



