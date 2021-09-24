require_relative 'bookingdate'

class Request
  attr_reader :space_id, :user_id, :date_start, :date_end

  def initialize(space_id:, user_id:, date_start:, date_end:)
    @space_id = space_id
    @user_id = user_id
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
    result = connection.exec("SELECT * FROM requests")
    result.map do |request|
      Request.new(space_id: request['space_id'], user_id: request['user_id'], date_start: starting.convert_to_date(request['date_start']), date_end: ending.convert_to_date(request['date_end']))
    end
  end

  def self.add(space_id:, user_id:, date_start:, date_end:)
    starting = BookingDate.new
    ending = BookingDate.new
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    result = connection.exec("INSERT INTO requests (space_id, user_id, date_start, date_end) VALUES(#{space_id}, #{user_id}, #{date_start}, #{date_end}) RETURNING id, space_id, user_id, date_start, date_end;")
    Request.new(space_id: result[0]['space_id'], user_id: result[0]['user_id'], date_start: starting.convert_to_date(result[0]['date_start']), date_end: ending.convert_to_date(result[0]['date_end']))
  end
end