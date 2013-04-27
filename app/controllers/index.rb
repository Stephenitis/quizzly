get '/' do
  # Look in app/views/index.erb
  session[:id]
  erb :index
end
