require('sinatra')
require('sinatra/contrib/all')
require_relative('models/tag.rb')
require_relative('models/transaction.rb')
require_relative('models/vendor.rb')

@balance = 1000

get '/' do
  @transactions = Transaction.all
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

get '/transactions/new' do
  @tags = Tag.all
  @vendors = Vendor.all
  erb(:new)
end

get '/tags/new' do
  @tags =Tag.all
  erb(:new_tag)
end

post '/transactions' do
  Transaction.new(params).save
  redirect to '/transactions'
end

post '/tags' do
  Tag.new(params).save
  redirect to '/tags'
end

get '/transactions/:id' do
  @transaction = Transaction.find(params['id'])
  erb(:show)
end

get '/tags/:id' do
  @tag = Tag.find(params['id'])
  erb(:show_tag)
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

put '/transactions/:id' do
  transaction = Transaction.new(params)
  transaction.update
  redirect to "/transactions/#{params['id']}"
end

put '/tags/:id' do
  tag = Tag.new(params)
  tag.update
  redirect to "/tags/#{params['id']}"
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
