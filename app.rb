require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/tags_controller.rb')
require_relative('controllers/transactions_controller.rb')
require_relative('controllers/vendors_controller.rb')
require_relative('controllers/budgets_controller.rb')

get '/' do
  @balance = Budget.all.first.balance.to_i
  @transactions = Transaction.all
  @transactions_last_five = Transaction.last_five
  @tags = Tag.all
  @vendors = Vendor.all
  erb(:display)
end
