require_relative './../../rental'
require_relative './../../teacher'
require_relative './../../book'

describe Book do
  context 'When testing the Rental class' do
    it 'should create a new Rental when rental class is instantiated' do
      teacher = Teacher.new('Ruby', 34, 'William Raga')
      book = Book.new('title', 'author')
      rental = Rental.new('2022-09-09', teacher, book)
      expect(rental.book.rental.length).to eq 1
      expect(rental.person.rental.length).to eq 1
    end
  end
end
