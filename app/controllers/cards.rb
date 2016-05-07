post '/games/:game_id/decks/:deck_id/cards/:id' do
  @deck = Deck.find_by(id: params[:deck_id])
  @game = Game.find_by(id: params[:game_id])
  @picked_card = Card.find_by(id: params[:id])
  @guess = Guess.create(card_id: @picked_card.id, game_id: @game.id)
  @playable_cards= @deck.cards - @game.cards
  @previous_card = @picked_card
  if @playable_cards.length > 0
    if params[:guess]
      if Card.check_answer?(@picked_card, params[:guess])
        Guess.update_guess(@guess)
      end
    end
    @picked_card = @playable_cards.sample
    erb :'/cards/show'
  else
    if Card.check_answer?(@picked_card, params[:guess])
        Guess.update_guess(@guess)
      end
    erb :'games/show'
  end
end

