get '/' do
  # Look in app/views/index.erb
  p params
  erb :index
end
