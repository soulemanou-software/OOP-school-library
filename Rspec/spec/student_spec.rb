require_relative './../../student'

describe Student do
  context 'When testing the Student class' do
    it 'should create a new Student when student class is instantiated' do
      student = Student.new(23, 'William Raga', true)
      expect(student.age).to eq 23
      expect(student.name).to eq 'William Raga'
    end
  end
end
