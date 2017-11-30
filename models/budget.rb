require_relative('../db/sql_runner')

class Budget

attr_accessor :id, :balance

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @balance = options['balance'].to_i
  end

  def save
    sql = "INSERT INTO budgets (balance) VALUES ($1) RETURNING id"
    values = [@balance]
    result = SqlRunner.run(sql, values)
    @id = result.first["id"].to_i
  end

  def update
    sql = "UPDATE budgets SET (balance) = ($1) WHERE id = $2"
    values = [@balance, @id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM budgets WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql ,values).first
    return Budget.new(result)
  end

  def self.all()
    sql = "SELECT * FROM budgets"
    values = []
    budget_data = SqlRunner.run(sql, values)
    return map_items(budget_data)
  end

  def self.map_items(budget_data)
    return budget_data.map {|budget| Budget.new(budget)}
  end
end
