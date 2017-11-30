require('sinatra')
require('sinatra/contrib/all')
require_relative('../helpers/strings.rb')
require_relative('../models/budget.rb')

get '/budgets' do
  @balance = Budget.all
  erb(:"budgets/index")
end

get '/budgets/new' do
  @budgets =budget.all
  erb(:"budgets/new")
end

post '/budgets' do
   budget = Budget.new(params)
   balance = budget.balance.to_f
   balance *=100
   budget.balance = balance
   budget.save
   redirect to ('/budgets')
end

get '/budgets/:id' do
  @budget = Budget.find(params['id'])
  erb(:"budgets/show")
end

get '/budgets/:id/edit' do
  @budgets = Budget.all
  @budget = Budget.find(params['id'])
  erb(:"budgets/edit")
end

put '/budgets/:id' do
   budget = Budget.new(params)
   balance = budget.balance.to_f
   balance *=100
   budget.balance = balance
   budget.update
   redirect to ("/")
end

post '/budgets/:id/delete' do
  budget = Budget.find(params['id'])
  budget.delete
  redirect to ('/budgets')
end
