require_relative '../book.rb'
describe Book do
    before (:all) do
        @book = Book.new('Rich dad poor dad','Robert K')
    end
    context 'Test the book title and book author' do
        it "Should return the book title Rich dad poor dad" do
            expect(@book.title).to eq 'Rich dad poor dad'
        end
        it "Should return the book author Robert K" do
            expect(@book.author).to eq 'Robert K'
        end
    end
    context 'Test how many books is rented' do
       it "Should add_rental method return 2" do
        person1 = double('person')
        person2 = double('person')
        @book.add_rental(person1,'12/05/2022')
        @book.add_rental(person2,'12/05/2022')
        expect(@book.rental.length).to eq 2
       end
    end
end