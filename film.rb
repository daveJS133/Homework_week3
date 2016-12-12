require ('pry')

require_relative('./db/sqlrunner.rb')



class Film
  attr_accessor :id
  attr_accessor :title, :price

  def initialize(options)
    @title = options['title'].to_s
    @price = options['price']

  end

  def self.save()
    sql = "INSERT INTO films (name) VALUES ('#{@name}');"
    film = SqlRunner.run( sql )
    @id = film['id'].to_i
  end

  def update()
    sql = "UPDATE films SET (title, price) = ('#{@title}', #{@price}) WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def delete()
      sql = "DELETE FROM films WHERE id = #{@id};"  
      SqlRunner.run(sql)
    end  

 def self.delete_all()
   sql = 'DELETE FROM customers'
   SqlRunner.run(sql)
 end

  def self.get_many(sql)
    films = SqlRunner.run(sql)
    result = films.map { |film| Film.new( film ) }
    return result
  end

  def customers()
    sql = "SELECT customers.* FROM customers 
          INNER JOIN tickets ON tickets.customer_id = customers.id 
          WHERE customer_id = #{@id};"
    return Customer.get_many(sql)
  end

end
