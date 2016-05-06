get '/decks' do
  @user = User.find_by(id: session[user_id])
  @decks = Deck.most_recent
  if logged_in?
    erb :'/decks/index'
  else
    redirect '/login'
end
