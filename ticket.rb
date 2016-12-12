require ('pry')

require_relative('./db/sqlrunner.rb')





class Ticket

  attr_accessor :customer_id, :film_id


  def initalize(options)
    @customer_id = options[customer_id].to_i
    @film_id = options[film_id].to_i
  end

  def self.save()
    sql = 'INSERT INTO tickets (customer_id, film_id) VALUES (#{@customer_id}, #{@film_id});'
    ticket = SqlRunner.run( sql )
    @id = ticket['id'].to_i
    customer.funds -= film.price
    customer.save()
  end


  def delete()
    sql = "DELETE FROM tickets WHERE id = #{@id};"  
    SqlRunner.run(sql)
  end  

  def self.delete_all()
    sql = 'DELETE FROM customers'
    SqlRunner.run(sql)
  end

  def self.get_many(sql)
    tickets = SqlRunner.run(sql)
    result = tickets.map { |ticket| Ticket.new( ticket ) }
    return result
  end

  def film()
    sql = "SELECT * FROM films WHERE id = #{@id}"
    film = SqlRunner.run(sql).first
    return Film.new(film)
  end

  def customer()
    sql = "SELECT * FROM customers WHERE id = #{@id}"
    customer = SqlRunner.run(sql).first
    return Customer.new(customer)
  end

end
