# get '/games/:game_id/decks/:deck_id/cards/:id' do
#   @deck = Deck.find_by(id: params[:deck_id])
#   @picked_card = @deck.cards.find_by(id:params[:id])
#   @game = Game.find_by(id: params[:game_id])
#   erb :'/cards/show'
# end

post '/games/:game_id/decks/:deck_id/cards/:id' do
  @deck = Deck.find_by(id: params[:deck_id])
  @game = Game.find_by(id: params[:game_id])
  @picked_card = Card.find_by(id: params[:id])
  @guess = Guess.create(card_id: @picked_card.id, game_id: @game.id)
  @playable_cards= @deck.cards - @game.cards
  @previous_card = @game.cards.last
  if @playable_cards.length > 0
    if params[:guess]
      if @picked_card.answer.downcase == params[:guess].downcase
        @guess.update_attributes(correct: true)
      end
    end
    @picked_card = @playable_cards.sample
    erb :'/cards/show'
  else
    if @picked_card.answer.downcase == params[:guess].downcase
        @guess.update_attributes(correct: true)
      end
    erb :'games/show'
  end
end

