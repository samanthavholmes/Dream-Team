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
  @shuffled_deck = @deck.cards.shuffle
  @card = @shuffled_deck.pop
  erb :'/decks/show'
end

post '/decks/:deck_id/cards/:id' do
  @deck = Deck.find(params[:deck_id])
  @card = @deck.cards.find(params[:id])
  @game = Game.create(deck_id: @deck.id, user_id: current_user.id)
  redirect "/games/#{@game.id}/decks/#{@deck.id}/cards/#{@card.id}"
end
