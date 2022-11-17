require_relative '../person.rb'
describe Person do
    before(:all) do
        @person1 = Person.new(23,'Meshu',parent_permission: true)
        @person2 = Person.new(15,'Mimi',parent_permission: false)
    end
    context 'when passing age as 23' do
        it 'can_use_services should return true' do
            expect(@person1.can_use_services?).to be true
        end

        it 'can_use_services should return false' do
            expect(@person2.can_use_services?).to be false
        end
        it 'correct_name should return Meshu' do
            expect(@person1.correct_name).to eq 'Meshu'
        end
        it 'Number of rental record should me 2' do
            book1 = double('Book')
            book2= double('Book')
            @person2.add_rental(book1,'02/05/2020')
            @person2.add_rental(book2,'03/05/2020')
            expect(@person2.rental.size).to eq(2)
        end
        it 'Age should be 23' do
            expect(@person1.age).to eq 23
        end

    end
end