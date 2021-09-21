require 'space'

describe Space do
  describe '.list_all' do
    it 'returns all spaces' do
      expect(Space.list_all).to include("Spacename1")
      expect(Space.list_all).to include("Spacename2")
      expect(Space.list_all).to include("Spacename3")
    end
  end
end