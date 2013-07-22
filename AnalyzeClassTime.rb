class AnalyzeClassTime
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
    puts "Start: #{Time.now}"
    get_words
    puts "get_words #{Time.now}"
    slice_to_symbols
    puts "slice_to_symbols #{Time.now}"
    count_occurrences
    puts "count_occurrences #{Time.now}"
    sort_words
    puts "sort_words #{Time.now}"
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
    how_much = @unique.size
    puts how_much
    @count=@unique.map {|x|
      how_much-=1;
      puts "time: #{Time.now}: #{how_much}" if how_much%1_000==0
      @arr.count x;
    }
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
end
