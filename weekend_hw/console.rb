require('pry-byebug')
require_relative('models/customers.rb')
require_relative('models/films.rb')
require_relative('models/tickets.rb')

Ticket.delete_all()
Customer.delete_all()
Film.delete_all()

customer1 = Customer.new('name' => 'Thomas','funds' => 100)
customer2 = Customer.new('name' => 'Aragorn','funds' => 600)
customer3 = Customer.new('name' => 'Elrond','funds' => 40)
customer1.save()
customer2.save()
customer3.save()

film1 = Film.new('title' => 'The Fellowship of the Ring','price' => 20)
film2 = Film.new('title' => 'The Two Towers','price' => 20)
film3 = Film.new('title' => 'The Return of the King','price' => 20)
film1.save()
film2.save()
film3.save()
film4 = Film.new('title' => 'Arrival', 'price' => 30)
film4.save()

ticket1 = Ticket.new('customer_id' => customer1.id,'film_id' => film1.id)
ticket1.save()
customer1.charge_customer(film1.price)


ticket2 = Ticket.new('customer_id' => customer2.id,'film_id' => film1.id)
ticket3 = Ticket.new('customer_id' => customer3.id,'film_id' => film3.id)

ticket4 = Ticket.new('customer_id' =>
customer1.id, 'film_id' => film2.id)
ticket4.save()
ticket2.save()
ticket3.save()




  binding.pry
  nil
