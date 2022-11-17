class Student
  def to_json(*arg)
    {
      'json_class' => self.class.name,

      'person' => [classroom, age, parent_permission, name, id]
    }.to_json(*arg)
  end

  def self.json_create(person)
    new(*person['person'])
  end
end
