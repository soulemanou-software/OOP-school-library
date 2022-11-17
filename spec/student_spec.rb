require_relative '../student.rb'
describe Student do
    before(:all) do
        @stud = Student.new(26,'Soulemanou',true)
    end
        it 'The method name should return Solemanou' do
            expect(@stud.correct_name).to eq 'Soulemanou'
        end
        it 'The method name should return 26' do
            expect(@stud.age).to eq 26
        end
        it 'The method name should return the input age' do
            @stud.age = 56
            expect(@stud.age).to eq 56
        end


end