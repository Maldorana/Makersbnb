class Space
  def self.list_all
    if ENV['ENVIRONMENT'] = 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    result = connection.exec("SELECT * FROM spaces")
    result.map { |space| space['name'] }
  end

  def self.add(name:, description:, price:)
    if ENV['ENVIRONMENT'] = 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    connection.exec("INSERT INTO spaces (name, description, price) VALUES ('#{name}', '#{description}', '#{price}');")
  end

end