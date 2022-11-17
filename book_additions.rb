require 'json'
class Book
  # generate
  def to_json(*arg)
    {
      'json_class' => self.class.name,
      'book' => [title, author]
    }.to_json(*arg)
  end

  # parse
  def self.json_create(book)
    new(*book['book'])
  end
end
