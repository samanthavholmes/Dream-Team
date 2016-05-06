get '/login' do
  erb :'/login'
end

post '/login' do
  user = User.find_by(username: params[:username])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect "/decks"
  else
    @errors = ["Incorrect username or password"]
    erb :'/login'
  end
end

get '/logout' do
  session.clear
  redirect '/'
end
