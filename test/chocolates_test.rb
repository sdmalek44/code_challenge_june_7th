require 'minitest/autorun'
require 'minitest/pride'
require './lib/chocolates'
require 'pry'


class ChocolatesTest < Minitest::Test
  def setup
    @c = Chocolates.new
    @s = Student.new(87)
  end

  def test_student_has_attributes_that_can_be_changed
    assert_equal 87, @s.grade
    assert_equal 1, @s.chocolates
    @s.chocolates += 1
    assert_equal 2, @s.chocolates
  end

  def test_it_exists
    assert_instance_of Chocolates, @c
  end

  def test_it_finds_chocolates_1
    grades = [100, 90, 80]
    chocolates = [3, 2, 1]
    assert_equal 6, @c.count_chocolates(grades)
    assert_equal chocolates, @c.candy_numbers
  end

  def test_it_finds_chocolates_2
    grades = [80, 90, 100]
    chocolates = [1, 2, 3]
    assert_equal 6, @c.count_chocolates(grades)
    assert_equal chocolates, @c.candy_numbers
  end

  def test_it_finds_chocolates_3
    grades = [100, 80, 90]
    chocolates = [2, 1, 2]
    assert_equal 5, @c.count_chocolates(grades)
    assert_equal chocolates, @c.candy_numbers
  end


  def test_it_finds_chocolates_4
    grades = [55, 91, 23, 27, 25, 41, 42, 32, 20, 82, 35, 45, 69, 33, 58]
    chocolates = [1, 2, 1, 2, 1, 2, 3, 2, 1, 2, 1, 2, 3, 1, 2]

    assert_equal 26, @c.count_chocolates(grades)
    assert_equal chocolates, @c.candy_numbers
  end

  def test_it_finds_chocolates_5
    grades = [68, 29, 39, 48, 74, 22, 67, 40, 73, 38, 45, 81, 67, 45, 75, 39,
              72, 78]
    chocolates =  [2,  1,  2,  3,  4,  1,  2,  1,  2,  1,  2,  3,  2,  1,  2,
                   1,  2,  3]
    assert_equal 35, @c.count_chocolates(grades)
    assert_equal chocolates, @c.candy_numbers
  end

  def test_it_finds_chocolates_6
    grades = [68, 26, 33, 71, 78, 39, 39, 83, 92, 44, 81, 44, 72, 99, 25, 20,
              69, 63, 66, 67, 46, 61, 71, 22, 36, 88, 94, 71, 21, 72, 58, 69,
              31, 72, 73, 89, 43, 92, 72, 35, 68, 85, 60, 41, 37, 65, 73, 86,
              60, 39]
    expect = [ 2,  1,  2,  3,  4,  1,  1,  2,  3,  1,  2,  1,  2,  3,  2,  1,
               2,  1,  2,  3,  1,  2,  3,  1,  2,  3,  4,  2,  1,  2,  1,  2,
               1,  2,  3,  4,  1,  3,  2,  1,  2,  4,  3,  2,  1,  2,  3,  4,
               2,  1]
    assert_equal 104, @c.count_chocolates(grades)
    assert_equal expect, @c.candy_numbers
  end

  def test_it_finds_chocolates_7
    grades = [21, 67, 49, 98, 88, 84, 39, 59, 72, 84, 25, 58, 62, 24, 32, 97,
              27, 98, 36, 55, 60, 31, 42, 87, 64, 27, 50, 21, 66, 41, 24, 99,
              40, 85, 97, 28, 70, 37, 67, 42, 53, 24, 32, 47, 28, 77, 76, 67,
              27, 92]
    chocolates = [1,  2,  1,  4,  3,  2,  1,  2,  3,  4,  1,  2,  3,  1,  2,
                  3,  1,  2,  1,  2,  3,  1,  2,  3,  2,  1,  2,  1,  3,  2,
                  1,  2,  1, 2,  3,  1,  2,  1,  2,  1,  2,  1,  2,  3,  1,
                  4,  3,  2,  1,  2]
    assert_equal 98, @c.count_chocolates(grades)
    assert_equal chocolates, @c.candy_numbers
  end

  def test_it_finds_chocolates_8
    grades = [94, 95, 87, 83, 93, 94, 71, 21, 51, 31, 27, 24, 65, 55, 28, 55,
            82, 33, 97, 65, 81, 37, 20, 76, 41, 92, 33, 22, 61, 85, 99, 87, 80,
             38, 70, 25, 64, 73, 26, 95, 37, 33, 52, 82, 20, 60, 37, 82, 73, 66]
    chocolates = [1,  3,  2,  1,  2,  3,  2,  1,  4,  3,  2,  1,  3,  2,  1,  2,
                  3,  1,  2,  1,  3,  2,  1,  2,  1,  3,  2,  1,  2,  3,  4,  3,
                  2,  1,  2,  1,  2,  3,  1,  3,  2,  1,  2,  3,  1,  2,  1,  3,
                  2,  1]

    assert_equal 100, @c.count_chocolates(grades)
    assert_equal chocolates, @c.candy_numbers
  end
end
