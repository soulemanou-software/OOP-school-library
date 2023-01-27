require './person'
require './student'
require './teacher'
require './book'
require './classroom'
require './rental'
require './persist'

class App
  def initialize
    @persist_people = Persist.new('person.json')
    @persist_books = Persist.new('book.json')
    @persist_rentals = Persist.new('rental.json')
    @books = []
    @persons = []
    @rentals = []
  end

  def start_console
    puts 'Welcome to my School Library!'
    until list_of_options
      input = gets.chomp
      if input == '7'
        puts 'Thank You for using my School Library!'
        break
      end

      option input
    end
  end

  def list_all_books
    books_list = @persist_books.load
    puts 'Database is empty! Add a book.' if books_list.empty?
    books_list.each_with_index { |book, i| puts "[Book #{i}] Title: #{book['title']}, Author: #{book['author']}" }
  end

  def list_all_persons
    people_list = @persist_people.load
    puts 'Database is empty! Add a person.' if people_list.empty?
    people_list.each_with_index do |person, i|
      puts "[#{i}] Name: #{person['name']}, Age: #{person['age']}, id: #{person['id']}"
    end
  end

  def create_person
    print 'To create a student, press 1, to create a teacher, press 2 : '
    option = gets.chomp

    case option
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Invalid input. Try again'
    end
  end

  def create_student
    puts 'Create a new student'
    print 'Enter student age: '
    age = gets.chomp.to_i
    print 'Enter name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase
    parent_permission = true if parent_permission == 'y'
    parent_permission = false if parent_permission == 'n'
    student = Student.new(age, name, parent_permission)
    @persons << student

    save = @persist_people.load
    @persons.each do |person|
      save << { name: person.name, id: person.id, age: person.age }
    end
    save_student = Persist.new('person.json')
    save_student.save(save)

    puts 'Student created successfully'
  end

  def create_teacher
    puts 'Create a new teacher'
    print 'Enter teacher age: '
    age = gets.chomp.to_i
    print 'Enter teacher name: '
    name = gets.chomp
    print 'Enter teacher specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(specialization, age, name)
    @persons << teacher

    save = @persist_people.load
    @persons.each do |person|
      save << { name: person.name, id: person.id, age: person.age }
    end
    save_teacher = Persist.new('person.json')
    save_teacher.save(save)

    puts 'Teacher created successfully'
  end

  def create_book
    puts 'Create a new book'
    print 'Enter title: '
    title = gets.chomp
    print 'Enter author: '
    author = gets
    book = Book.new(title, author)
    @books.push(book)

    save = @persist_books.load
    @books.each do |b|
      save << { title: b.title, author: b.author }
    end
    save_book = Persist.new('book.json')
    save_book.save(save)

    puts "Book #{title} created successfully."
  end

  # rubocop:disable Metrics/MethodLength
  def create_rental
    puts 'Select which book you want to rent by entering its number'
    list_all_books
    book_id = gets.chomp.to_i
    puts 'Select a person from the list by its number'
    list_all_persons
    person_id = gets.chomp.to_i
    print 'Date: '
    date = gets.chomp.to_s
    rental = Rental.new(date, @persist_people.load[person_id], @persist_books.load[book_id])
    @rentals << rental

    save = @persist_rentals.load
    @rentals.each do |rent|
      save << { date: rent.date, book: { title: rent.book['title'], author: rent.book['author'] }, person: {
        id: rent.person['id'],
        name: rent.person['name'],
        age: rent.person['age']
      } }
    end
    save_rental = Persist.new('rental.json')
    save_rental.save(save)
    puts 'Rental created successfully'
  end
  # rubocop:enable Metrics/MethodLength

  def list_all_rentals
    rentals_list = @persist_rentals.load
    puts 'To see person rentals enter the person ID: '
    list_all_persons
    id = gets.chomp.to_i
    puts 'Rented Books:'
    rentals_list.each do |rental|
      # rubocop:disable Layout/LineLength
      if rental['person']['id'] == id
        puts "Person: #{rental['person']['name']}  Date: #{rental['date']}, Book: '#{rental['book']['title']}' by #{rental['book']['author']}"
      else
        puts 'No records where found for the given ID'
      end
      # rubocop:enable Layout/LineLength
    end
  end
end
