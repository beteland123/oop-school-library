require_relative 'handler'
def main
  handle = HandleMenu.new
  handle.welcome
  loop do
    input = handle.option
    case input
    when '1'
      puts handle.all_books
    when '2'
      puts handle.all_people
    when '3'
      puts handle.create_person
    when '4'
      handle.create_book
    when '5'
      puts handle.create_rent
    when '6'
      puts handle.list_rent
    when '7'
      puts 'Thank you for using this app!'
      break
    else
      puts 'Invalid input'
    end
  end
end

main
