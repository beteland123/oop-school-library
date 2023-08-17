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
     if @books.empty?
        puts "No books avaliable"
     else
        @books.each do |book|
          puts "Title: \"#{book.title}\", Author: #{book.author}" 
        end; nil
    end
    end 
    
    def all_people
        if @person.empty?
           puts "No person avaliable"
        else
           @person.each do |p|
             puts "[#{p.type}]  Name: #{p.name}, ID : #{p.id} , Age: #{p.age}" 
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
    puts "Student created successfully"
   end
   
end