require './nameable'

class Person < Nameable
  attr_accessor :name, :age, :rentals
  attr_reader :id

  def initialize(name, age = 'unknow', parent_permission = 'true')
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def correct_name
    @name
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def add_rental(person, date)
    rental = Rental.new(date, self, person)
   @rentals.push(rental)
  end

  private

  def of_age?
    @gae >= 18
  end
end
