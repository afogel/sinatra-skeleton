helpers do
  def logged_in?
    session[:account_id]
  end

  def account
    Account.find(session[:account_id])
  end

  def current_account
    @current_account
  end
end

# Homepage (Root path)
get '/' do
  erb :index
end

# Homepage (Root path)
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


before '/account/:id' do
  redirect '/' unless logged_in?
end

get '/account/:id' do
  @show_account = Account.find(params[:id])
  erb(:"/accounts/show")

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

