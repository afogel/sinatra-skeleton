before '/account/:id' do
  redirect '/' unless logged_in?
end

get '/account/:id' do
  @show_account = Account.find(params[:id])
  erb(:"/accounts/show")
end
