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
        @books.each do |book|
          puts "Title: \"#{book.title}\", Author: #{book.author}" 
        end; nil
    end   
   def create_book(title,author)
    book = Book.new(title,author)
    @books << book
   end
end