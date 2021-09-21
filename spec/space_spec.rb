require 'space'

describe Space do
  describe '.list_all' do
    it 'returns all spaces' do
      Space.add(name: "Spacename1", description: "Spacedescription1", price: "Spaceprice1")
      Space.add(name: "Spacename2", description: "Spacedescription2", price: "Spaceprice2")
      Space.add(name: "Spacename3", description: "Spacedescription3", price: "Spaceprice3")
      
      spaces = Space.list_all

      expect(spaces).to include("Spacename1")
      expect(spaces).to include("Spacename2")
      expect(spaces).to include("Spacename3")
    end
  end

  describe '.add' do
    it 'adds a new space' do
      Space.add(name: "Spacename10", description: "Spacedescription10", price: "Spaceprice10")
      expect(Space.list_all).to include("Spacename10")
    end
  end
end