require 'test/unit'
require 'text_analyzer'

class TextAnalyzerTest < Test::Unit::TestCase
  def setup
    @string='this is some some text is is'
    @a=TextAnalyzer.new  @string
    @a.init
    
    @a2= (TextAnalyzer.new  @string)
    @a2.init
  end
  def test_text
    assert_equal @string, @a.text, 'Text not equal'
  end
  
  def test_textaz
    assert_equal @string, @a.textaz
  end
  
  def test_arr
    assert @a2.arr == @a.arr
  end
  
  def test_arrays
    assert  @a2.unique == @a.unique
    assert  @a2.zipped == @a.zipped
    assert  @a2.count == @a.count
  end
  
  def test_hash
    assert_equal @a2.to_h, @a.to_h
  end
  
  def test_init
    assert @a2.init == @a.init
  end
  
  def test_to_h
    assert @a2.to_h == @a.to_h
  end
  
  def test_to_s
    assert @a2.to_s == @a.to_s
  end
  
  def test_values_from_list
    r = rand(1..(@a.unique.length))
    assert (@a2.values_from_list r) == (@a.values_from_list r)
    
  end
  
  def test_quantity
    assert @a2.unique.length == @a.unique.length
  end
  
  def test_lenght
    assert @a2.arr.length == @a.arr.length
  end
  
  def test_percentage
    r= rand(1..@a.unique.length)
    
    assert (@a2.percentage @a2.unique[r]) ==  (@a.percentage @a.unique[r] )
  end
  
  def test_percentages
    assert @a2.percentages == @a.percentages
  end
  
  def test_equality
    assert true == (@a2==@a)
  end
  
  def test_plus
    a3 = @a+@a2
    assert_not_nil a3
    assert (@string+"\n"+@string) == a3.text, 'Text is not equal'
    assert (@string+"\n"+@string) == a3.textaz, 'Textaz is not equal'
    assert (@a2.arr+@a2.arr)== a3.arr
    #test for unique
    #test for count
    #test for zipped
    #test for hash
  end
  
end