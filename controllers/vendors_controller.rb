require('sinatra')
require('sinatra/contrib/all')
require_relative('../helpers/strings.rb')
require_relative('../models/vendor.rb')


get '/vendors' do
  @vendors = Vendor.all
  erb(:"vendors/index")
end

get '/vendors/new' do
  @vendors =Vendor.all
  erb(:"vendors/new")
end

post '/vendors' do
  Vendor.new(params).save
  redirect to ('/vendors')
end

get '/vendors/:id' do
  @vendor = Vendor.find(params['id'])
  erb(:"vendors/show")
end

get '/vendors/:id/edit' do
  @vendors = Vendor.all
  @vendor = Vendor.find(params['id'])
  erb(:"vendors/edit")
end

put '/vendors/:id' do
  vendor = Vendor.new(params)
  vendor.update
  redirect to ("/vendors/#{params['id']}")
end

post '/vendors/:id/delete' do
  vendor = Vendor.find(params['id'])
  vendor.delete
  redirect to ('/vendors')
end
