require('sinatra')
require('sinatra/contrib/all')
require_relative('../helpers/strings.rb')
require_relative('../models/tag.rb')
require_relative('../models/transaction.rb')
require_relative('../models/vendor.rb')
require_relative('../models/budget.rb')

get '/transactions' do
  @transactions = Transaction.all
  erb(:"transactions/index")
end

get '/transactions/new' do
  @tags = Tag.all
  @vendors = Vendor.all
  erb(:"transactions/new")
end

post '/transactions' do
  transaction =Transaction.new(params)
  price = transaction.price.to_f
  price *=100
  transaction.price = price
  transaction.save
  redirect to ('/transactions')
end

get '/transactions/:id' do
  @transaction = Transaction.find(params['id'])
  erb(:"transactions/show")
end

get '/transactions/:id/edit' do
  @tags = Tag.all
  @vendors = Vendor.all
  @transaction = Transaction.find(params['id'])
  erb(:"transactions/edit")
end

put '/transactions/:id' do
  transaction = Transaction.new(params)
  price = transaction.price.to_f
  price *=100
  transaction.price = price
  transaction.update
  redirect to ("/transactions/#{params['id']}")
end

post '/transactions/:id/delete' do
  transaction = Transaction.find(params['id'])
  transaction.delete
  redirect to ('/transactions')
end

get '/transaction/delete' do
  erb(:"transactions/clear")
end

post '/transaction/delete/all' do
  Transaction.delete_all
  redirect to ('/budgets')
end
