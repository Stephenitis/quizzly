get '/upload' do
  erb :upload
end


post '/upload' do
  filename = params[:file][:filename]
  tempfile = params[:file][:tempfile]
  @target = "public/uploads/#{filename}"

  File.open(@target, 'wb') {|f| f.write tempfile.read }

  "success"
end
