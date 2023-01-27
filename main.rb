require './app'
@app = App.new

def main
  options
end

def display_list
  puts 'Welcome to School library App!'
  puts "
    Choose an option by entering a number:
    1 - List all books
    2 - List all people
    3 - Create a person
    4 - Create a book
    5 - Create a rental
    6 - List all rentals for a given person id
    7 - Exit"
end

# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/CyclomaticComplexity
def options
  loop do
    display_list
    option = gets.chomp.to_i
    case option
    when 1
      @app.list_all_books
    when 2
      @app.list_all_people
    when 3
      @app.create_person
    when 4
      @app.create_book
    when 5
      @app.create_rental
    when 6
      @app.list_all_rentals
    when 7
      puts 'Thank you for using this app'
      break
    else
      puts 'invalid Input. Please try again'
      break
    end
  end
end
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/CyclomaticComplexity

main
