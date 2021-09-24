class Request
  attr_reader :space_id, :user_id, :date

  def initialize(space_id:, user_id:, date: )
    @space_id = space_id
    @user_id = user_id
    @date = date
   
  end

  def self.list_all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    result = connection.exec("SELECT * FROM requests")
    result.map do |request|
      Request.new(space_id: request['space_id'], user_id: request['user_id'], date: request['date'])
    end
  end

  def self.add(space_id:, user_id:, date:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    result = connection.exec("INSERT INTO requests (space_id, user_id, date) VALUES(#{space_id}, #{user_id}, #{date}) RETURNING id, space_id, user_id, date;")
    Request.new(space_id: result[0]['space_id'], user_id: result[0]['user_id'], date: result[0]['date'])
  end
end