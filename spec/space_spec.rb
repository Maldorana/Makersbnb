require 'space'

describe Space do
  describe '.list_all' do
    it 'returns all spaces' do
      expect(Space.list_all).to include("Spacename1")
      expect(Space.list_all).to include("Spacename2")
      expect(Space.list_all).to include("Spacename3")
    end
  end

  describe '.add' do
    it 'adds a new space' do
      Space.add(name: "Spacename10", description: "Spacedescription10", price: "Spaceprice10")
      expect(Space.list_all).to include("Spacename10")
    end
  end
end