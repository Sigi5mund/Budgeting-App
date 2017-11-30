require_relative('../models/transaction.rb')
require_relative('../models/tag.rb')
require_relative('../models/vendor.rb')
require_relative('../models/budget.rb')
require('pry-byebug')

tag1 = Tag.new({'category' => 'groceries'})
tag2 =Tag.new({'category' => 'clothes'})
tag3 = Tag.new({'category' => 'coffees'})
tag4 =Tag.new({'category' => 'fun'})
tag5 = Tag.new({'category' => 'bill'})
tag6 =Tag.new({'category' => 'train'})

tag1.save
tag2.save
tag3.save
tag4.save
tag5.save
tag6.save

vendor1 = Vendor.new({'name' => 'Asda'})
vendor2 = Vendor.new({'name' => 'Top Shop'})
vendor3 = Vendor.new({'name' => 'Starbucks'})
vendor4 = Vendor.new({'name' => 'Pub'})
vendor5 = Vendor.new({'name' => 'Scottish Power'})
vendor6 = Vendor.new({'name' => 'Scot rail'})

vendor1.save
vendor2.save
vendor3.save
vendor4.save
vendor5.save
vendor6.save

transaction1 = Transaction.new({
  'name' => 'Weekly shop',
  'tag_id' => tag1.id,
  'price' => 6515,
  'vendor_id' => vendor1.id,
  'date' => '2017/11/02',
  'comment' => 'Forgot washing powder'})

transaction2 = Transaction.new({
  'name' => 'Quick lunchtime break',
  'tag_id' => tag3.id,
  'price' => 220,
  'vendor_id' => vendor3.id,
  'date' => '2017/11/02',
  'comment' => ''})

transaction3 = Transaction.new({
  'name' => 'Work shirt',
  'tag_id' => tag2.id,
  'price' => 1599,
  'vendor_id' => vendor2.id,
  'date' => '2017/11/05',
  'comment' => 'Claim on expenses'})

transaction4 = Transaction.new({
  'name' => 'Meeting for work',
  'tag_id' => tag3.id,
  'price' => 547,
  'vendor_id' => vendor3.id,
  'date' => '2017/11/11',
  'comment' => 'biscuits too'})

transaction5 = Transaction.new({
  'name' => 'The lads',
  'tag_id' => tag4.id,
  'price' => 2524,
  'vendor_id' => vendor4.id,
  'date' => '2017/11/11',
  'comment' => 'Discount night!'})

transaction6 = Transaction.new({
  'name' => 'Gas and electric',
  'tag_id' => tag5.id,
  'price' => 7175,
  'vendor_id' => vendor5.id,
  'date' => '2017/11/12',
  'comment' => 'Higher than last Autumn!'})

transaction7 = Transaction.new({
  'name' => 'Council Tax',
  'tag_id' => tag6.id,
  'price' => 5391,
  'vendor_id' => vendor6.id,
  'date' => '2017/11/12',
  'comment' => 'one more payment left'})

transaction8 = Transaction.new({
  'name' => 'On way home',
  'tag_id' => tag3.id,
  'price' => 795,
  'vendor_id' => vendor3.id,
  'date' => '2017/11/14',
  'comment' => 'got a takeaway salad'})


transaction9 = Transaction.new({
    'name' => 'Ticket to London',
    'tag_id' => tag6.id,
    'price' => 4925,
    'vendor_id' => vendor6.id,
    'date' => '2017/11/15',
    'comment' => 'return ticket discount'})

transaction10 = Transaction.new({
  'name' => 'Coffee on train to London',
  'tag_id' => tag3.id,
  'price' => 220,
  'vendor_id' => vendor6.id,
  'date' => '2017/11/15',
  'comment' => ''})




transaction1.save
transaction2.save
transaction3.save
transaction4.save
transaction5.save
transaction6.save
transaction7.save
transaction8.save
transaction9.save
transaction10.save


budget = Budget.new({
'balance' => 30000
})
budget.save
