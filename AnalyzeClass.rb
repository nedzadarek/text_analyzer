class AnalyzeClass
  attr_accessor :text
  attr_reader :arr, :unique,:textaz, :zipped, :count
  def initialize text
    @text=text
    @textaz
    @arr
    @unique
    @zipped
    @count
    @hash
    
  end
  def init
    get_words
    slice_to_symbols
    count_occurrences
    sort_words
    to_h
  end
  def get_words 
    @textaz=@text.downcase.gsub /[^a-z]/, ' ' #/[\.,\"]/, ' '
  end
  
  def slice_to_symbols
    @textaz||=get_words
    @arr=@textaz.split(' ').map{|x| x.to_sym}
    return true
  end
  
  def count_occurrences 
    @unique = @arr.uniq
    @count=@unique.map {|x| arr.count x}
  #  return @unique, @count
    return true
  end
  def sort_words
    @zipped = (@unique.zip @count).sort {|x, y| y[1]<=>x[1]}
    @count = []
    @unique = []
    @zipped.each{|x| @unique << x[0] }
    @zipped.each{|x| @count <<  x[1] }
    #return @unique, @count, @zipped
    return true
  end
  def to_h
    @hash ||= Hash[@zipped]
  end
  def to_s
    'done'
  end
  def == ob
    @text==ob.text
  end
  
  def values_from_list quantity
    @hash.values_at *@unique[0...quantity]
  end
  
  def quantity
    @unique.length
  end
  
  def length
    @arr.length
  end
  
  def percentage symbol
    c = length
    w = @hash[symbol]
    return w.to_f/c
  end
  
  def percentages
    per = []
    @unique.each{|x| per<< (percentage x)}
    Hash[@unique.zip per]
  end
  
  #adds 2 object and create new object
  def + obj
    
      #@text=text
      #@textaz
      #@arr
      #@unique
      #@zipped
      #@count
      #@hash
    
    new=AnalyzeClass.new @text+"\n"+obj.text
    new.instance_variable_set(:@textaz, @textaz+"\n"+obj.textaz)
    
    arr=@arr+obj.arr
    new.instance_variable_set(:@arr, arr)
    
    
    u=arr.uniq
    c=u.map {|x| arr.count x}
    zipped = (u.zip c).sort {|x, y| y[1]<=>x[1]}
    u=c=[]
    zipped.each{|x| u << x[0];c <<  x[1]  }
    #zipped.each{|x| c <<  x[1] }
    new.instance_variable_set(:@unique, u)
    new.instance_variable_set(:@count, c)
    new.instance_variable_set(:@zipped, zipped)
    new.instance_variable_set(:@hash, Hash[zipped])
    
    
    return new
  end
end
