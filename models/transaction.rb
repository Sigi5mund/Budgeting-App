require_relative('../db/sql_runner')
require_relative('./tag.rb')

class Transaction

   attr_accessor :tag_id, :price, :comment, :store, :date, :name, :id

  def initialize(options)
     @id = options['id'].to_i if options['id']
     @name = options['name']
     @tag_id = options['tag_id'].to_i
     @price = options['price']
     @store = options['store']
     @date = options['date']
     @comment = options['comment']
  end

  def save
    sql = "INSERT INTO transactions
    (name, tag_id, price, store, date, comment)
    VALUES ($1, $2, $3, $4, $5, $6)
    RETURNING id"
    values = [@name, @tag_id, @price, @store, @date, @comment]
    result = SqlRunner.run(sql, values)
    @id = result.first['id']
  end

  def tag
    return Tag.find(@tag_id)
  end

  def by_tag
    return self.find(tag_id)
  end

  def update
    sql = "UPDATE transactions SET (name, tag_id, price, store, date, comment) = ($1, $2, $3, $4, $5, $6)
    WHERE id = $7"
    values = [@name, @tag_id, @price, @store, @date, @comment, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM transactions
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all
    sql = "SELECT * FROM transactions"
    values = []
    transaction_data = SqlRunner.run(sql, values)
    return map_items(transaction_data)
  end

  def self.map_items(transaction_data)
    return transaction_data.map {|transaction| Transaction.new(transaction)}
  end

  def self.find(id)
    sql = "SELECT * FROM transactions
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    return Transaction.new(result)
  end

end
