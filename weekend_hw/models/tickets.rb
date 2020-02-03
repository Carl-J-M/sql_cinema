require('pg')
require_relative("../db/sql_runner")

class Ticket

  attr_reader :id
  attr_accessor :customer_id, :film_id

  def initialize(options)
    @id = options['id'] if options['id']
    @customer_id = options['customer_id'].to_i
    @film_id = options['film_id'].to_i
  end

  def save()
    sql = "INSERT INTO tickets (
      customer_id,
      film_id
      ) VALUES (
        $1, $2
      )
      RETURNING id"
      values = [@customer_id, @film_id]
      customer = SqlRunner.run(sql, values).first
      @id = customer['id'].to_i
  end
  def update()
    sql = "UPDATE tickets SET (customer_id, film_id) = ($1, $2) WHERE id = $3"
    values = [@customer_id, @film_id, @id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM tickets"
    ticket_data = SqlRunner.run(sql)
    return Ticket.map_items(ticket_data)
  end

  def self.delete_all()
     sql = "DELETE FROM tickets"
     SqlRunner.run(sql)
  end
  def self.map_items(ticket_data)
    result = ticket_data.map { |ticket| Ticket.new( ticket) }
    return result
  end
end
