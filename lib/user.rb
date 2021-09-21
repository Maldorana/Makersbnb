# require 'database_connection'
require 'bcrypt'

class User
  attr_reader :id, :email, :username

  def initialize(id:, email:, username:)
    @id = id
    @email = email
    @username = username
  end

  def self.create(email:, username:, password:)
    
  encrypted_password = BCrypt::Password.create(password)

    if ENV['ENVIRONMENT'] == "test"
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    result = connection.exec_params(
      "INSERT INTO users (email, username, password) VALUES($1, $2, $3) RETURNING id, email, username, password;", 
      [email, username, encrypted_password])
    User.new(id: result[0]['id'], email: result[0]['email'], username: result[0]['username'])
    # result = DatabaseConnection.query(
    #   "INSERT INTO users (email, username, password) VALUES($1, $2, $3) RETURNING id, email, username;",
    #   [email, username, password]
    # )
    # User.new(id: result[0]['id'], email: result[0]['email'], username: result[0]['username'])
  end

  def self.find(id)
    return nil unless id
    if ENV['ENVIRONMENT'] == "test"
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    result = connection.exec("SELECT * FROM users WHERE id = $1", [id])
    User.new(id: result[0]['id'], email: result[0]['email'], username: result[0]['username'])
  #   return nil unless id
  #   result = DatabaseConnection.query(
  #     "SELECT * FROM users WHERE id = $1",
  #     [id]
  #   )
  #   User.new(result[0]['id'], result[0]['email'], result[0]['username'])
  end
end
