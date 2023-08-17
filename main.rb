
require_relative 'app'

def welcome
  puts "Welcome to School Library App !"
end

def get_input
  puts "Please choose an  option by enterin a number"
  puts " 1 - List all books"
  puts " 2 - List all people"
  puts " 3 - Create a person"
  puts " 4 - Create a book"
  puts " 5 - Create a rental"
  puts " 6 - List all renatals for a given person id"
  puts " 7 - Exit"

input = gets().chomp()
input
end

def create_book(app)
  print "Title : "
   title = gets().chomp()
  print "Author : "
  author = gets().chomp()
  app.create_book(title,author)
end


def main
  app = App.new()
  welcome
  loop do 
    input = get_input()
    case input
    when "1"
       puts app.all_books()
    when "2" 
       puts "Value was 2" 
    when "3"
       puts "Value was 3"
    when "4"
      create_book(app)
    when "5" 
      puts "Value was 5"  
    when "6"
      puts "Value was 6"
    when "7"
      then break
    else
      puts "Invalid number"
    end
  end
end

main()


