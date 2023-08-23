require 'json'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'classroom'
require_relative 'rental'
class App
  attr_accessor :book, :people, :rental

  def all_books
    book_counter = 1
    data = read_file('book.json')
    if data.empty?
      puts 'No books avaliable'
    else
      data.each do |book|
        puts "#{book_counter}. Title: \"#{book.title}\", Author: #{book.author}"
        book_counter += 1
      end; nil
    end
  end

  def all_people
    person_counter = 1

    if @person.empty?
      puts 'No person avaliable'
    else
      @person.each do |p|
        puts "#{person_counter}. [#{p.type}]  Name: #{p.name}, ID : #{p.id} , Age: #{p.age}"
        person_counter += 1
      end; nil
    end
  end

  def create_book(title, author)
    Book.new(title, author)
    book_data = {
      'Title' => title,
      'Author' => author
    }
    write_file('book.json', book_data)
    puts 'Book created successfully'
    puts
  end

  def add_student(room, age, name, permission)
    stud = Student.new(room, age, name:, parent_permission: permission)
    stud.type = 'Student'
    @person << stud
    puts 'Person created successfully'
  end

  def add_teach(special, age, name)
    teach = Teacher.new(special, age, name:)
    teach.type = 'Teacher'
    @person << teach
    puts 'Person created successfully'
  end

  def add_rent(date, person_index, book_index)
    person = @person[person_index - 1]
    book = @books[book_index - 1]
    rent = Rental.new(date, person, book)
    @rental << rent
    puts 'Rent created successfully'
  end

  def rent_list(id)
    person = find_person_by_id(id)

    if person
      puts 'Rentals :'

      person.rental.each do |rental|
        puts "Date: #{rental.date} , Book: \"#{rental.book.title}\" by #{rental.person.name} "
      end; nil
    else
      puts "No person found with ID #{id}"
    end
  end

  def find_person_by_id(id)
    @person.find { |p| p.id == id }
  end

  def write_file(fil_name, new_data_item)
    data = read_file(fil_name)
    data << new_data_item if data

    begin
      File.write(fil_name, data.to_json)
    rescue StandardError => e
      puts "Error writing file: #{e}"
    end
  end

  def read_file(filename)
    unless File.exist?(filename)
      File.open(filename, 'a')
      return []
    end

    data = File.read(filename)
    JSON.parse(data) unless data.empty?
  end
end
