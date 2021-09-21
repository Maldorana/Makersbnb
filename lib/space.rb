class Space
  def self.list_all
    connection = PG.connect(dbname: 'makersbnb')
    result = connection.exec("SELECT * FROM spaces")
    result.map { |space| space['name'] }
  end
end