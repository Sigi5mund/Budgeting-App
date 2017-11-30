require_relative('../db/sql_runner')

class Tag

attr_accessor :id, :category

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @category = options['category']
  end

  def save
    sql = "INSERT INTO tags (category) VALUES ($1) RETURNING id"
    values = [@category]
    result = SqlRunner.run(sql, values)
    @id = result.first["id"].to_i
  end

  def update
    sql = "UPDATE tags SET (category) = ($1) WHERE id = $2"
    values = [@category, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM tags WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def total
    sql = "select SUM(price) from transactions where transactions.tag_id = $1"
    values =[@id]
    result = SqlRunner.run(sql, values)
    return result.first['sum']
  end

  def self.find(id)
    sql = "SELECT * FROM tags
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql ,values).first
    return Tag.new(result)
  end

  def self.all()
    sql = "SELECT * FROM tags order by category ASC"
    values = []
    tag_data = SqlRunner.run(sql, values)
    return map_items(tag_data)
  end

  def self.map_items(tag_data)
    return tag_data.map {|tag| Tag.new(tag)}
  end

end
