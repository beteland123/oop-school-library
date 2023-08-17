require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'name'
require_relative 'decorator'
require_relative 'book'
require_relative 'classroom'
require_relative 'rental'
class App
    def initialize
       @books = [] 
       @person = []
       @rental = []
    end
    def all_books
        book_counter = 1
     if @books.empty?
        puts "No books avaliable"
     else
        @books.each do |book|
          puts "#{book_counter}. Title: \"#{book.title}\", Author: #{book.author}"
          book_counter += 1 
        end; nil
    end
    end 
    
    def all_people
        person_counter = 1
        if @person.empty?
           puts "No person avaliable"
        else
           @person.each do |p|
             puts "#{person_counter}. [#{p.type}]  Name: #{p.name}, ID : #{p.id} , Age: #{p.age}" 
             person_counter += 1
           end; nil
       end
       end  
   def create_book(title,author)
    book = Book.new(title,author)
    @books << book
    puts "Book created successfully"
    puts
   end
   def add_student(room,age, name,permission)
    stud = Student.new(room, age, name: name, parent_permission: permission)
    stud.type = "Student"
    @person << stud
    puts "Person created successfully"
   end
   def add_teach(special,age,name)
    teach = Teacher.new(special,age,name: name)
    teach.type = "Teacher"
    @person << teach
    puts "Person created successfully"
   end
   def add_rent(date, person_index, book_index)
    person = @person[person_index-1]
    book = @books[book_index-1]
    rent = Rental.new(date,person,book)
    @rental << rent
    puts "Rent created successfully"
  end
  
end