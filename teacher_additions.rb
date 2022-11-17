class Teacher
  def to_json(*arg)
    {
      'json_class' => self.class.name,
      'person' => [specialization, age, parent_permission, name, id]
    }.to_json(*arg)
  end
  #   def initialize(specialization, age, parent_permission, name = 'unknown')

  def self.json_create(person)
    new(*person['person'])
  end
end
