get '/' do
  # Look in app/views/index.erb
  if session[:id]
    redirect to "/user/#{session[:id]}"
  else
    erb :index
  end
end
