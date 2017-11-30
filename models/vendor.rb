require_relative('../db/sql_runner')


class Vendor

attr_reader :id, :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name'].capitalize
  end

  def save
    sql = "INSERT INTO vendors (name) VALUES ($1) RETURNING id"
    values = [@name]
    result = SqlRunner.run(sql, values)
    @id = result.first["id"].to_i
  end

  def update
    sql = "UPDATE vendors SET (name) = ($1) WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM vendors WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def total
    sql = "select SUM(price) from transactions where transactions.vendor_id = $1"
    values =[@id]
    result = SqlRunner.run(sql, values)
    return result.first['sum']
  end

  def self.find(id)
    sql = "SELECT * FROM vendors WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql ,values).first
    return Vendor.new(result)
  end

  def self.all()
    sql = "SELECT * FROM vendors order by name ASC"
    values = []
    vendor_data = SqlRunner.run(sql, values)
    return map_items(vendor_data)
  end

  def self.map_items(vendor_data)
    return vendor_data.map {|vendor| Vendor.new(vendor)}
  end

end
