get '/signup' do
  erb :signup
end

post '/signup' do
  @account = Account.new
  @account.email = params[:email]
  @account.hashed_password = params[:password]

  if @account.save
    @account = Account.find_by_email(params[:email])
    session[:account_id] = @account.id
    redirect '/'
  else
    erb :index
  end
end

post '/login' do
  @account = Account.find_by_email(params[:email])

  if @account.hashed_password == params[:password]
    session[:account_id] = @account.id
    redirect '/'
  else
    redirect '/'
  end
end

get '/logout' do
  session[:account_id] = nil
  redirect '/'
end
