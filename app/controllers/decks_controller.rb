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
  # session[:shuffled_deck] = [@shuffled_deck]
  erb :'/decks/show'
end

post '/decks/:deck_id/cards/:id' do
  @deck = Deck.find(params[:deck_id])
  @picked_card = @deck.cards.find_by(id: params[:id])
  @game = Game.create(deck_id: @deck.id, user_id: current_user.id)
  redirect "/games/#{@game.id}/decks/#{@deck.id}/cards/#{@picked_card.id}"
end
