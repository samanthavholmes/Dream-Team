get '/games/:game_id/decks/:deck_id/cards/:id' do
  @deck = Deck.find_by(id: params[:deck_id])
  @card = @deck.cards.find_by(id:params[:id])
  @game = Game.find_by(id: params[:game_id])
  erb :'/cards/show'
end

post '/games/:game_id/decks/:deck_id/cards/:id' do
  @deck = Deck.find_by(id: params[:deck_id])
  @card = @deck.cards.find_by(id: params[:id])
  @game = Game.find_by(id: params[:game_id])
  @guess = Guess.create(card_id: @card.id, game_id: @game.id)
  if @card.answer.downcase == params[:guess].downcase
    @guess.update_attributes(correct: true)
  end
  erb :'/cards/show'
end
