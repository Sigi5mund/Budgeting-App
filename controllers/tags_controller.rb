require('sinatra')
require('sinatra/contrib/all')
require_relative('../helpers/strings.rb')
require_relative('../models/tag.rb')


get '/tags' do
  @tags = Tag.all
  erb(:"tags/index")
end

get '/tags/new' do
  @tags =Tag.all
  erb(:"tags/new")
end

post '/tags' do
  Tag.new(params).save
  redirect to ('/tags')
end


get '/tags/:id' do
  @tag = Tag.find(params['id'])
  erb(:"tags/show")
end

get '/tags/:id/edit' do
  @tags = Tag.all
  @tag = Tag.find(params['id'])
  erb(:"tags/edit")
end

put '/tags/:id' do
  tag = Tag.new(params)
  tag.update
  redirect to ("/tags/#{params['id']}")
end

post '/tags/:id/delete' do
  tag = Tag.find(params['id'])
  tag.delete
  redirect to ('/tags')
end
