class Space
  def self.list_all
    connection = PG.connect(dbname: 'makersbnb')
    result = connection.exec("SELECT * FROM spaces")
    result.map { |space| space['name'] }
  end

  def self.add(name:, description:, price:)
    connection = PG.connect(dbname: "makersbnb")
    connection.exec("INSERT INTO spaces (name, description, price) VALUES ('#{name}', '#{description}', '#{price}');")
  end

end