require('pry')

require_relative('./db/sqlrunner.rb')


class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name'].to_s
    @funds = options['funds']

  end

  def save()
    sql = 'INSERT INTO customers (name, funds) VALUES (#{@name}, #{@funds})
    RETURNTING *;'
    customer = SqlRunner.run( sql )
    @id = customer[0]['id'].to_i
  end


  def update()
    sql = "UPDATE customers SET (name, funds) = ('#{@name}', #{@funds}) WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM costumers WHERE id = #{@id};"  
    SqlRunner.run(sql)
  end  

  def self.delete_all()
    sql = 'DELETE FROM customers'
  end


  def self.get_many(sql)
    customers = SqlRunner.run(sql)
    result = customers.map { |customer| Customer.new( customer ) }
    return result
  end

  def films()
    sql = "SELECT films.* from films 
    INNER JOIN tickets ON tickets.film_id = films.id 
    WHERE customer_id = #{@id}"
    return Film.get_many(sql)
  end

end