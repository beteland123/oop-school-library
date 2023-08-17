
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

def add_studnet(app)
  print "Age : "
  age = gets().chomp()
  print "Name : "
  name = gets().chomp()
  print "Classroom : "
  room = gets().chomp()
  print "Has parent permission? [Y/N] : "
  permission = gets().chomp()
  if permission == 'Y' || permission == 'y'
    permission = true
  elsif permission == 'N' || permission == 'n'
    permission = false
  else
    puts "Invalid input "
  end
  app.add_student(room,age, name,permission)
end

def  add_teacher(app)
  print "Age : "
  age = gets().chomp()
  print "Name : "
  name = gets().chomp()
  print "Specialization: "
  special = gets().chomp()
  app.add_teach(special,age,name)
end


def create_person(app)
  print "Do you want to create a student (1) or a teacher (2)? [Input the number] : "
     num = gets().chomp().to_i
  if num == 1
    add_studnet(app)
  elsif num == 2
    add_teacher(app)
  else
    puts "Invalid input "
  end
end

def create_rent(app)
  puts "Select a book from the following list by number"
  app.all_books
  book_num = gets().chomp().to_i
  puts "Select a person from the following list by number (not id)"
  app.all_people
  person_num = gets().chomp().to_i
  print "Date : "
  date = gets().chomp()
  app.add_rent(date,person_num, book_num)
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
       puts app.all_people()
    when "3"
       puts create_person(app)
    when "4"
      create_book(app)
    when "5" 
      puts create_rent(app)  
    when "6"
      puts list_rent(app)
    when "7"
      then break
    else
      puts "Invalid input"
    end
  end
end

main()


