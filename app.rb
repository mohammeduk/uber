require 'json'
require 'net/http'
require 'sinatra'

# Mongoid.load!("data/mongoid.yml", :production)

Dir[File.join(File.dirname(__FILE__), 'lib/*.rb')].each do |file|
  require file
end

get '/' do
  erb :index
end

get '/login' do
  # if session[:username]
  # redirect '/'
  erb :login
end

get '/search' do
  # BabyWeaningDiary.search(params)
end

post '/search/' do
  @search_term = BabyWeaningDiary.new.search "#{params[:search]}"

  erb :searchResults
  # BabyWeaningDiary.search(params)
end
