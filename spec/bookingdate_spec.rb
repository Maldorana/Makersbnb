require 'bookingdate'

describe BookingDate do
  describe '#convert_to_date' do
    it 'converts the ugly number to a date' do
      expect(subject.convert_to_date("20210929")).to eq(Date.parse("2021-09-29"))
    end
  end
end