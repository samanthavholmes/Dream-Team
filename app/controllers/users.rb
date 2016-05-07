get '/users/new' do
  erb :'/users/new'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect '/decks'
  else
    @errors = @user.errors.full_messages
    erb :'/users/new'
  end
end

get '/users/:id' do
  if logged_in?
    @played_decks = current_user.played_decks.group(:id)
    @played_games = current_user.played_games
    @game_correct_hash = current_user.guesses.where(correct:true).group(:game_id).count
    @game_incorrect_hash = current_user.guesses.where(correct:false).group(:game_id).count
    erb :'/users/show'
  else
    redirect '/'
  end
end
