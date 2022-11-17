require_relative '../teacher.rb'
describe Teacher do
    before (:all) do
        @teacher = Teacher.new("Full Stack", 29, 'Melashu')
    end
    it 'specialization should be able to Full Stack' do
        expect(@teacher.specialization).to eq('Full Stack')
    end
     it 'Age should be able to 29' do
        expect(@teacher.age).to eq(29)
    end
     it 'Age should be able to the input' do
        @teacher.age = 50
        expect(@teacher.age).to eq(50)
    end
     it 'Name should be able to the Melashu' do
        expect(@teacher.name).to eq('Melashu')
    end
    it 'Name should be able to the the new input' do
        @teacher.name = 'Mekedes'
        expect(@teacher.name).to eq('Mekedes')
    end


end
