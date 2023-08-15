require_relative 'name'
class Decorator < Nameable
  def initialize(person_name)
    super()
    @nameable = person_name
  end

  def correct_name
    @nameable.correct_name
  end
end

class CapitalizeDecorator < Decorator
  def correct_name
    @nameable.correct_name.upcase
  end
end

class TrimmerDecorator < Decorator
  def correct_name
    name = @nameable.correct_name.upcase
    if name.length > 10
      name[0..9]
    else
      name
    end
  end
end
