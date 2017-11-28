require_relative('../models/transaction.rb')
require_relative('../models/tag.rb')
require_relative('../models/vendor.rb')
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

vendor1 = Vendor.new({'name' => 'Asda'})
vendor2 = Vendor.new({'name' => 'Top Shop'})
vendor3 = Vendor.new({'name' => 'Tesco'})
vendor4 = Vendor.new({'name' => 'David Bann'})
vendor5 = Vendor.new({'name' => 'Scottish Power'})
vendor6 = Vendor.new({'name' => 'Council'})

vendor1.save
vendor2.save
vendor3.save
vendor4.save
vendor5.save
vendor6.save

transaction1 = Transaction.new({
  'name' => 'Weekly shop',
  'tag_id' => tag1.id,
  'price' => 65,
  'vendor_id' => vendor1.id,
  'date' => '20/11/17',
  'comment' => 'Forgot washing powder'})

transaction2 = Transaction.new({
  'name' => 'Work shirt',
  'tag_id' => tag2.id,
  'price' => 15,
  'vendor_id' => vendor2.id,
  'date' => '19/11/17',
  'comment' => 'Claim on expenses'})

transaction3 = Transaction.new({
  'name' => 'Washing Powder',
  'tag_id' => tag3.id,
  'price' => 6,
  'vendor_id' => vendor3.id,
  'date' => '20/11/17',
  'comment' => ''})

transaction4 = Transaction.new({
  'name' => 'Meal',
  'tag_id' => tag4.id,
  'price' => 43,
  'vendor_id' => vendor4.id,
  'date' => '22/11/17',
  'comment' => 'Used the voucher for discount!'})

transaction5 = Transaction.new({
  'name' => 'DD gas and electric',
  'tag_id' => tag5.id,
  'price' => 105,
  'vendor_id' => vendor5.id,
  'date' => '24/11/17',
  'comment' => 'Higher than last Autumn!'})

transaction6 = Transaction.new({
  'name' => 'Council Tax',
  'tag_id' => tag6.id,
  'price' => 98,
  'vendor_id' => vendor6.id,
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
