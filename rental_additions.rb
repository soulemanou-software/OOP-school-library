class Rental
  def to_json(*arg)
    {
      'json_class' => self.class.name,
      'rental' => [date, book, person]
    }.to_json(*arg)
  end

  def self.json_create(rental)
    new(*rental['rental'])
  end
end
