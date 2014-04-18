require_relative 'helper'

class TestCalIntegration < MiniTest::Unit::TestCase

  def test_a_regular_month
    actual_output = ''
    IO.popen('./cal 4 2014', 'r+') do |pipe|
      actual_output = pipe.read
    end

    expected_output = <<EOS
     April 2014
Su Mo Tu We Th Fr Sa
       1  2  3  4  5
 6  7  8  9 10 11 12
13 14 15 16 17 18 19
20 21 22 23 24 25 26
27 28 29 30
EOS
    assert_equal expected_output, actual_output
  end

  def test_a_regular_february
    actual_output = ''
    IO.popen('./cal 2 2014', 'r+') do |pipe|
      actual_output = pipe.read
    end

    expected_output = <<EOS
   February 2014
Su Mo Tu We Th Fr Sa
                   1
 2  3  4  5  6  7  8
 9 10 11 12 13 14 15
16 17 18 19 20 21 22
23 24 25 26 27 28
EOS
    assert_equal expected_output, actual_output
  end

  def test_a_leap_february
    actual_output = ''
    IO.popen('./cal 2 2012', 'r+') do |pipe|
      actual_output = pipe.read
    end

    expected_output = <<EOS
   February 2012
Su Mo Tu We Th Fr Sa
          1  2  3  4
 5  6  7  8  9 10 11
12 13 14 15 16 17 18
19 20 21 22 23 24 25
26 27 28 29
EOS
    assert_equal expected_output, actual_output
  end

  def test_an_unusual_leap_february
    actual_output = ''
    IO.popen('./cal 2 2000', 'r+') do |pipe|
      actual_output = pipe.read
    end

    expected_output = <<EOS
   February 2000
Su Mo Tu We Th Fr Sa
       1  2  3  4  5
 6  7  8  9 10 11 12
13 14 15 16 17 18 19
20 21 22 23 24 25 26
27 28 29
EOS
    assert_equal expected_output, actual_output
  end

  def test_a_6_line_month
    actual_output = ''
    IO.popen('./cal 12 2012', 'r+') do |pipe|
      actual_output = pipe.read
    end

    expected_output = <<EOS
   December 2012
Su Mo Tu We Th Fr Sa
                   1
 2  3  4  5  6  7  8
 9 10 11 12 13 14 15
16 17 18 19 20 21 22
23 24 25 26 27 28 29
30 31
EOS
    assert_equal expected_output, actual_output
  end

  def test_a_4_line_month
    actual_output = ''
    IO.popen('./cal 2 2015', 'r+') do |pipe|
      actual_output = pipe.read
    end

    expected_output = <<EOS
   February 2015
Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
EOS
    assert_equal expected_output, actual_output
  end

  def test_an_early_month
    actual_output = ''
    IO.popen('./cal 2 1800', 'r+') do |pipe|
      actual_output = pipe.read
    end

    expected_output = <<EOS
   February 1800
Su Mo Tu We Th Fr Sa
                   1
 2  3  4  5  6  7  8
 9 10 11 12 13 14 15
16 17 18 19 20 21 22
23 24 25 26 27 28
EOS
    assert_equal expected_output, actual_output
  end

  def test_a_month_that_starts_on_sunday
    actual_output = ''
    IO.popen('./cal 3 2015', 'r+') do |pipe|
      actual_output = pipe.read
    end

    expected_output = <<EOS
     March 2015
Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
29 30 31
EOS
    assert_equal expected_output, actual_output
  end

  def test_a_basic_year
    actual_output = ''
    IO.popen('./cal 2014', 'r+') do |pipe|
      actual_output = pipe.read
    end

    expected_output = <<EOS
                             2014

      January               February               March
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
          1  2  3  4                     1                     1  
 5  6  7  8  9 10 11   2  3  4  5  6  7  8   2  3  4  5  6  7  8  
12 13 14 15 16 17 18   9 10 11 12 13 14 15   9 10 11 12 13 14 15  
19 20 21 22 23 24 25  16 17 18 19 20 21 22  16 17 18 19 20 21 22  
26 27 28 29 30 31     23 24 25 26 27 28     23 24 25 26 27 28 29  
                                            30 31                 
       April                  May                   June
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
       1  2  3  4  5               1  2  3   1  2  3  4  5  6  7  
 6  7  8  9 10 11 12   4  5  6  7  8  9 10   8  9 10 11 12 13 14  
13 14 15 16 17 18 19  11 12 13 14 15 16 17  15 16 17 18 19 20 21  
20 21 22 23 24 25 26  18 19 20 21 22 23 24  22 23 24 25 26 27 28  
27 28 29 30           25 26 27 28 29 30 31  29 30                 
                                                                  
        July                 August              September
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
       1  2  3  4  5                  1  2      1  2  3  4  5  6  
 6  7  8  9 10 11 12   3  4  5  6  7  8  9   7  8  9 10 11 12 13  
13 14 15 16 17 18 19  10 11 12 13 14 15 16  14 15 16 17 18 19 20  
20 21 22 23 24 25 26  17 18 19 20 21 22 23  21 22 23 24 25 26 27  
27 28 29 30 31        24 25 26 27 28 29 30  28 29 30              
                      31                                          
      October               November              December
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
          1  2  3  4                     1      1  2  3  4  5  6  
 5  6  7  8  9 10 11   2  3  4  5  6  7  8   7  8  9 10 11 12 13  
12 13 14 15 16 17 18   9 10 11 12 13 14 15  14 15 16 17 18 19 20  
19 20 21 22 23 24 25  16 17 18 19 20 21 22  21 22 23 24 25 26 27  
26 27 28 29 30 31     23 24 25 26 27 28 29  28 29 30 31           
                      30                                          
EOS
    assert_equal expected_output, actual_output
  end

  def test_a_leap_year
    skip
    actual_output = ''
    IO.popen('./cal 2000', 'r+') do |pipe|
      actual_output = pipe.read
    end

    expected_output = <<EOS
EOS
    assert_equal expected_output, actual_output
  end

  def test_a_year_with_six_line_months
    skip
    actual_output = ''
    IO.popen('./cal 2012', 'r+') do |pipe|
      actual_output = pipe.read
    end

    expected_output = <<EOS
EOS
    assert_equal expected_output, actual_output
  end

  def test_a_year_with_four_line_months
    skip
    actual_output = ''
    IO.popen('./cal 2015', 'r+') do |pipe|
      actual_output = pipe.read
    end

    expected_output = <<EOS
EOS
    assert_equal expected_output, actual_output
  end
end
