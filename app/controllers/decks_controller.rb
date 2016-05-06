get '/decks' do
  @user = User.find_by(id: session[:user_id])
  @decks = Deck.all
  if logged_in?
    erb :'/decks/index'
  else
    redirect '/login'
  end
end

get '/decks/:id' do
  @deck = Deck.find_by(id: params[:id])
  erb :'/decks/show'
end
