class App 
    @books=[]
    @rental = []
    @person=[]

    def create_book
        puts "Title: "
        title=gets.chomp
        puts "Author: "
        author=gets.chomp
        book=Book.new(title,author)
        @books.push(book) unless @books.include?(book)
        puts "Tilte : #{title} and author: #{author} was created successfully"
    end

    def create_student
        puts 'Age: '
    age = gets.chomp.to_i

    puts 'Classroom: '
    classroom = gets.chomp

    puts 'Name: '
    name = gets.chomp

    has_permission = permission?

    student = Student.new(name,age,has_permission,classroom)
    @person << student unless @person.include?(student)

    puts "The student '#{name}' aged '#{age}' with the classroom '#{classroom}' was created successfully"
  end

  def create_teacher
    puts 'Age: '
    age = gets.chomp.to_i

    puts 'Specialization: '
    specialization = gets.chomp

    puts 'Name: '
    name = gets.chomp

    teacher = Teacher.new(name,age,specialization)
    @person << teacher unless @person.include?(teacher)

    puts "The teacher '#{name}' aged '#{age}' with specialization in '#{specialization}' was created successfully "
  end
  