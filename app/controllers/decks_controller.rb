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
  @picked_card = @shuffled_deck.pop
  erb :'/decks/show'
end

post '/decks/:deck_id/cards/:id' do
  @deck = Deck.find(params[:deck_id])
  @game = Game.create(deck_id: @deck.id, user_id: current_user.id)
  @game.cards << @deck.cards.shuffle
  @picked_card = @deck.cards.find_by(id: params[:id])
  redirect "/games/#{@game.id}/decks/#{@deck.id}/cards/#{@picked_card.id}"
end
