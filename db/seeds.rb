require_relative('../models/transaction.rb')
require_relative('../models/tag.rb')
require('pry-byebug')

tag1 = Tag.new({'category' => 'groceries'})
tag2 =Tag.new({'category' => 'clothes'})
tag3 = Tag.new({'category' => 'sundries'})
tag4 =Tag.new({'category' => 'leisure'})
tag5 = Tag.new({'category' => 'bill'})
tag6 =Tag.new({'category' => 'council tax'})

tag1.save
tag2.save
tag3.save
tag4.save
tag5.save
tag6.save

transaction1 = Transaction.new({
  'name' => 'Weekly shop',
  'tag_id' => tag1.id,
  'price' => 65,
  'store' => 'Asda',
  'date' => '20/11/17',
  'comment' => 'Forgot washing powder'})

transaction2 = Transaction.new({
  'name' => 'Work shirt',
  'tag_id' => tag2.id,
  'price' => 15,
  'store' => 'Top Shop',
  'date' => '19/11/17',
  'comment' => 'Claim on expenses'})

transaction3 = Transaction.new({
  'name' => 'Washing Powder',
  'tag_id' => tag3.id,
  'price' => 6,
  'store' => 'Asda',
  'date' => '20/11/17',
  'comment' => ''})

transaction4 = Transaction.new({
  'name' => 'Meal with gf',
  'tag_id' => tag4.id,
  'price' => 43,
  'store' => 'David Bann',
  'date' => '22/11/17',
  'comment' => 'Used the voucher for discount!'})

transaction5 = Transaction.new({
  'name' => 'DD gas and electric',
  'tag_id' => tag5.id,
  'price' => 105,
  'store' => 'ScottishPower',
  'date' => '24/11/17',
  'comment' => 'Higher than last Autumn!'})

transaction6 = Transaction.new({
  'name' => 'Council Tax',
  'tag_id' => tag6.id,
  'price' => 98,
  'store' => 'Asda',
  'date' => '25/11/17',
  'comment' => ''})

transaction1.save
transaction2.save
transaction3.save
transaction4.save
transaction5.save
transaction6.save


binding.pry
nil
