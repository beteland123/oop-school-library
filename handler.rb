require_relative 'app'
class HandleMenu
  def initialize
    @app = App.new
  end

  def welcome
    puts 'Welcome to School Library App !'
  end

  def option
    puts 'Please choose an  option by enterin a number'
    puts ' 1 - List all books'
    puts ' 2 - List all people'
    puts ' 3 - Create a person'
    puts ' 4 - Create a book'
    puts ' 5 - Create a rental'
    puts ' 6 - List all renatals for a given person id'
    puts ' 7 - Exit'

    gets.chomp
  end

  def all_books
    @app.all_books
  end

  def all_people
    @app.all_people
  end

  def create_book
    print 'Title : '
    title = gets.chomp
    print 'Author : '
    author = gets.chomp
    @app.create_book(title, author)
  end

  def add_studnet
    print 'Age : '
    age = gets.chomp
    print 'Name : '
    name = gets.chomp
    print 'Classroom : '
    room = gets.chomp
    print 'Has parent permission? [Y/N] : '
    permission = gets.chomp
    if %w[Y y].include?(permission)
      permission = true
    elsif %w[N n].include?(permission)
      permission = false
    else
      puts 'Invalid input '
    end
    @app.add_student(room, age, name, permission)
  end

  def add_teacher
    print 'Age : '
    age = gets.chomp
    print 'Name : '
    name = gets.chomp
    print 'Specialization: '
    special = gets.chomp
    @app.add_teach(special, age, name)
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number] : '
    num = gets.chomp.to_i
    if num == 1
      add_studnet
    elsif num == 2
      add_teacher
    else
      puts 'Invalid input '
    end
  end

  def create_rent
    puts 'Select a book from the following list by number'
    @app.all_books
    book_num = gets.chomp.to_i
    puts 'Select a person from the following list by number (not id)'
    @app.all_people
    person_num = gets.chomp.to_i
    print 'Date : '
    date = gets.chomp
    @app.add_rent(date, person_num, book_num)
  end

  def list_rent
    puts 'Id of person: '
    id = gets.chomp.to_i
    @app.rent_list(id)
  end
end
