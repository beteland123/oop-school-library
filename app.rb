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
        puts "#{book_counter}. Title: \"#{book['Title']}\", Author: #{book['Author']}"
        book_counter += 1
      end; nil
    end
  end

  def all_people
    person_counter = 1
    data = read_file('person.json')
    if data.empty?
      puts 'No person avaliable'
    else
      data.each do |p|
        puts "#{person_counter}. [#{p['Type']}]  Name: #{p['Name']}, ID : #{p['id']} , Age: #{p['Age']}"
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
    stud = Student.new(room, age, name: name, parent_permission: permission)
    stud.type = 'Student'
    student_data = {
      'Classroom' => stud.classroom,
      'Age' => stud.age,
      'Name' => stud.name,
      'Parent_permission' => stud.parent_permission,
      'Type' => stud.type,
      'id' => stud.id
    }
    write_file('person.json', student_data)
    puts 'Person created successfully'
  end

  def add_teach(special, age, name)
    teach = Teacher.new(special, age, name: name)
    teach.type = 'Teacher'
    teacher_data = {
      'Age' => teach.age,
      'Name' => teach.name,
      'Type' => teach.type,
      'id' => teach.id
    }
    write_file('person.json', teacher_data)
    puts 'Person created successfully'
  end

  def add_rent(date, person_index, book_index)
    books = read_file('book.json')
    people = read_file('person.json')
    person_hash = people[person_index - 1]
    book_hash = books[book_index - 1]
    person = Person.new(person_hash['Age'], name: person_hash['Name'],
                                            parent_permission: person_hash['Parent_permission'])
    book = Book.new(book_hash['Title'], book_hash['Author'])
    rental = Rental.new(date, person, book)
    rentals = {
      'date' => rental.date,
      'person' => rental.person.name,
      'book' => rental.book.title
    }
    write_file('rentals.json', rentals)
    puts 'Rent created successfully'
  end

  def rent_list(id)
    person = find_person_by_id(id)

    if person
      puts 'Rentals :'

      rentals = read_file('rentals.json')
      person_rentals = rentals.select do |rental|
        rental['person'] == person['Name']
      end

      person_rentals.each do |rental|
        puts " Date: #{rental['date']}, Book: #{rental['book']} by #{rental['person']}"
      end; nil
    else
      puts "No person found with ID #{id}"
    end
  end

  def find_person_by_id(id)
    people = read_file('person.json')
    people.find { |p| p['id'] == id }
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
