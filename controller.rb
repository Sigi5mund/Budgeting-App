require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('helpers/strings.rb')
require_relative('models/tag.rb')
require_relative('models/transaction.rb')
require_relative('models/vendor.rb')
require_relative('models/budget.rb')

get '/' do
  @balance = Budget.all.first.balance.to_i
  @transactions = Transaction.all
  @transactions_last_five = Transaction.last_five
  @tags = Tag.all
  @vendors = Vendor.all
  erb(:display)
end

get '/transactions' do
  @transactions = Transaction.all
  erb(:index)
end

get '/tags' do
  @tags = Tag.all
  erb(:index_tag)
end

get '/vendors' do
  @vendors = Vendor.all
  erb(:index_vendor)
end

get '/budgets' do
  @balance = Budget.all
  erb(:index_budget)
end

get '/transactions/new' do
  @tags = Tag.all
  @vendors = Vendor.all
  erb(:new)
end

get '/tags/new' do
  @tags =Tag.all
  erb(:new_tag)
end

get '/vendors/new' do
  @vendors =Vendor.all

  erb(:new_vendor)
end

get '/budgets/new' do
  @budgets =budget.all
  erb(:new_budget)
end

post '/transactions' do
  transaction =Transaction.new(params)
  price = transaction.price.to_f
  price *=100
  transaction.price = price
  transaction.save
  redirect to '/transactions'
end

post '/tags' do
  Tag.new(params).save
  redirect to '/tags'
end

post '/vendors' do
  Vendor.new(params).save
  redirect to '/vendors'
end

post '/budgets' do
  Budget.new(params).save
  redirect to '/budgets'
end

get '/transactions/:id' do
  @transaction = Transaction.find(params['id'])
  erb(:show)
end

get '/tags/:id' do
  @tag = Tag.find(params['id'])
  erb(:show_tag)
end

get '/vendors/:id' do
  @vendor = Vendor.find(params['id'])
  erb(:show_vendor)
end

get '/budgets/:id' do
  @budget = Budget.find(params['id'])
  erb(:show_budget)
end

get '/transactions/:id/edit' do
  @tags = Tag.all
  @vendors = Vendor.all
  @transaction = Transaction.find(params['id'])
  erb(:edit)
end

get '/tags/:id/edit' do
  @tags = Tag.all
  @tag = Tag.find(params['id'])
  erb(:edit_tag)
end

get '/vendors/:id/edit' do
  @vendors = Vendor.all
  @vendor = Vendor.find(params['id'])
  erb(:edit_vendor)
end

get '/budgets/:id/edit' do
  @budgets = Budget.all
  @budget = Budget.find(params['id'])
  erb(:edit_budget)
end

put '/transactions/:id' do
  transaction = Transaction.new(params)
  price = transaction.price.to_f
  price *=100
  transaction.price = price
  transaction.update
  redirect to "/transactions/#{params['id']}"
end

put '/tags/:id' do
  tag = Tag.new(params)
  tag.update
  redirect to "/tags/#{params['id']}"
end

put '/vendors/:id' do
  vendor = Vendor.new(params)
  vendor.update
  redirect to "/vendors/#{params['id']}"
end

put '/budgets/:id' do
  budget = Budget.new(params)
  budget.update
  redirect to "/"
end

post '/transactions/:id/delete' do
  transaction = Transaction.find(params['id'])
  transaction.delete
  redirect to '/transactions'
end

post '/tags/:id/delete' do
  tag = Tag.find(params['id'])
  tag.delete
  redirect to '/tags'
end

post '/vendors/:id/delete' do
  vendor = Vendor.find(params['id'])
  vendor.delete
  redirect to '/vendors'
end

post '/budgets/:id/delete' do
  budget = Budget.find(params['id'])
  budget.delete
  redirect to '/budgets'
end

get '/transaction/delete' do
  erb(:transactions_clear)
end

post '/transaction/delete/all' do
  Transaction.delete_all
  redirect to '/budgets'
end
