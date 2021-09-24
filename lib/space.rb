require_relative 'bookingdate'

class Space
  attr_reader :id, :name, :description, :price, :date_start, :date_end

  def initialize(id:, name:, description:, price:, date_start:, date_end:)
    @id = id
    @name = name
    @description = description
    @price = price
    @date_start = date_start
    @date_end = date_end
  end

  def self.list_all
    starting = BookingDate.new
    ending = BookingDate.new
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    result = connection.exec("SELECT * FROM spaces")
    result.map do |space| 
      Space.new(id: space['id'], name: space['name'], description: space['description'], price: space['price'], date_start: starting.convert_to_date(space['date_start']), date_end: ending.convert_to_date(space['date_end']))
    end
  end

  def self.add(name:, description:, price:, date_start: nil, date_end: nil, user_id: nil)
    starting = BookingDate.new
    ending = BookingDate.new
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    result = connection.exec_params("INSERT INTO spaces (name, description, price, date_start, date_end, user_id) VALUES ($1, $2, $3, $4, $5, $6) RETURNING id, name, description, price, date_start, date_end, user_id;", [name, description, price, date_start, date_end, user_id])
    Space.new(id: result[0]['id'], name: result[0]['name'], description: result[0]['description'], price: result[0]['price'], date_start: starting.convert_to_date(result[0]['date_start']), date_end: ending.convert_to_date(result[0]['date_end']))
  end

  def self.find(id:)
    starting = BookingDate.new
    ending = BookingDate.new
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    result = connection.exec("SELECT * FROM spaces WHERE id = #{id}")
    Space.new(id: result[0]['id'], name: result[0]['name'], description: result[0]['description'], price: result[0]['price'], date_start: starting.convert_to_date(result[0]['date_start']), date_end: ending.convert_to_date(result[0]['date_end']))
  end

  def self.delete(id:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    result = connection.exec("DELETE FROM spaces WHERE id = #{id}")
  end
end