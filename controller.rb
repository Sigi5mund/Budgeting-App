require('sinatra')
require('sinatra/contrib/all')
require_relative('models/tag.rb')
require_relative('models/transaction.rb')

@balance = 1000

get '/' do
  @transactions = Transaction.all
  @tags = Tag.all
  erb(:display)
end

get '/transactions' do
  @transactions = Transaction.all
  erb(:index)
end

get '/transactions/new' do
  @tags = Tag.all
  erb(:new)
end

post '/transactions' do
  Transaction.new(params).save
  redirect to '/transactions'
end

get '/transactions/:id' do
  @transaction = Transaction.find(params['id'])
  erb(:show)
end

get '/transactions/:id/edit' do
  @tags = Tag.all
  @transaction = Transaction.find(params['id'])
  erb(:edit)
end

put '/transactions/:id' do
  transaction = Transaction.new(params)
  transaction.update
  redirect to "/transactions/#{params['id']}"
end

post '/transactions/:id/delete' do
  transaction = Transaction.find(params['id'])
  transaction.delete
  redirect to '/transactions'
end
