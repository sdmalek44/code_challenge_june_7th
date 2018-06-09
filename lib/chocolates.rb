
class Student
  attr_accessor :grade,
                :chocolates

  def initialize(grade)
    @grade = grade
    @chocolates = 1
  end
end

class Chocolates

  def count_chocolates(grades)
    @students = []
    @ascending = []
    @descending = []
    @last_grade = -1
    grades.each do |grade|
      add_new_student(grade)
    end
    last_chocolates
    candy_numbers.sum
  end

  def candy_numbers
    @students.map {|student| student.chocolates }
  end
  
  def add_new_student(grade)
    student = Student.new(grade)
    if @last_grade == -1
      @ascending << student
    elsif @descending == [] && @ascending.length > 0
      add_to_ascending(student)
    elsif @ascending == [] && @descending.length > 0
      add_to_descending(student)
    end
    @last_grade = grade
  end

  def add_to_ascending(student)
    if student.grade < @ascending[-1].grade
      last_student = @ascending.pop
      last_student.chocolates = 1
      @descending << last_student
      @students << @ascending
      @students = @students.flatten
      @ascending = []
      add_to_descending(student)
    else
      if student.grade == @ascending[-1].grade
        student.chocolates = @ascending[-1].chocolates
        @ascending << student
      else
        student.chocolates += @ascending.length
        @ascending << student
      end
    end
  end

  def add_to_descending(student)
    if student.grade > @descending[-1].grade
      last_student = @descending.pop
      last_student.chocolates = 1
      @ascending << last_student
      correct_last_number
      @students << @descending
      @students = @students.flatten
      @descending = []
      add_to_ascending(student)
    else
      if student.grade == @descending[-1].grade
        student.chocolates = @descending[-1].chocolates
        @descending << student
      else
        @descending.each {|person| person.chocolates += 1}
        @descending << student
      end
    end
  end

  def correct_last_number
    if @descending[0] != nil && @students[-1] != nil
      @descending[0].chocolates = @students[-1].chocolates + 1
    end
    if @descending[0] != nil && @students[-1] != nil && @descending[1] != nil
      if @students[-1].chocolates > @descending[1].chocolates
        @descending[0].chocolates = @students[-1].chocolates + 1
      end
      if @students[-1].chocolates <  @descending[1].chocolates
        @descending[0].chocolates = @descending[1].chocolates + 1
      end
    end
  end

  def last_chocolates
    if @ascending != []
      @students << @ascending
      @students = @students.flatten
      @ascending = []
    elsif @descending != []
      correct_last_number
      @students << @descending
      @students = @students.flatten
      @descending = []
    end
  end
end
