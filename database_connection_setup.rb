require '.lib/database_connection'

if ENV['ENVIRONMENT'] == 'test' 
  DatabaseConnection.setup('users_test')
else 
  DatabaseConnection.setup('users')
end 