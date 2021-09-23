class BookingDate
  def convert_to_date(date)
    strdate = date[0..3] + "-" + date[4..5] + "-" + date[6..7]
    Date.parse(strdate)
  end
end