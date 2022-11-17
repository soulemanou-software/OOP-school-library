require_relative './../../teacher'

describe Teacher do
  context 'When testing the Teacher class' do
    it 'should create a new teacher when teacher class is instantiated' do
      teacher = Teacher.new('Ruby on Rails', 34, 'Duane David')
      expect(teacher.specialization).to eq 'Ruby on Rails'
      expect(teacher.name).to eq 'Duane David'
      expect(teacher.age).to eq 34
    end
  end
end
