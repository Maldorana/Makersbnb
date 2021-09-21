# require 'database_connection'

# describe DatabaseConnection do 
#   describe '.setup' do 
#     it 'sets up a connection to a database through PG' do
#       expect(PG).to receive(:connect).with(dbname: 'makersbnb')

#       DatabaseConnection.setup('makersbnb')
#     end

#     it 'this connection is persistent' do 
#       connection = DatabaseConnection.setup('makersbnb')
#       expect(DatabaseConnection.connection).to eq connection
#     end 
  
  
#   end 
# end 

