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

post '/decks/:deck_id' do
  @deck = Deck.find(params[:deck_id])
  @game = Game.create(deck_id: @deck.id, user_id: current_user.id)
  @picked_card = @deck.cards.sample
  erb :'/cards/show'
end
