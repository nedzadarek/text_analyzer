Simple utility to analyze text[word count, percentage etc]. 
Work in progress!  

Sample text[Red ridding hood, by Charles Perrault] from: http://www.pitt.edu/~dash/type0333.html

Changelog
22-07-2012:
- Added AnalyzeClass.rb & AnalyzeClassTime.rb that are classes made of analyze.rb & db.rb
- *Time.rb shows some info about time
20-08-2013
- changed names of class from 'AnalyzeClass.rb' to 'text_analyzer'
26-08-2013
- added/changed methods: to_s and inspect

How to use:
- load 'text_analyzer.rb' [make sure you run ruby from classes directory ]
- a = TextAnalyzer.new 'This some text some some'
- a.init
Then you can get:
> quantity of unique words:
- a.quantity
=> 3
> number of all words:
- a.length
=> 5
> origin text
- a.text
=> "This some text some some"
> array of unique words[as symbols]:
- a.unique
=> [:some, :this, :text]
> number of occurrences of words in text
- a.count
=> [3, 1, 1]
> hash containing words and their occurrences
- a.to_h
=> {:some=>3, :this=>1, :text=>1}
> number of occurrences of words in text from start to given number
- a.values_from_list 2
=> [3, 1]
> percentage of given word in text
- a.percentage :some
=> 0.6
> percentage of all words
- a.percentages
=> {:some=>0.6, :this=>0.2, :text=>0.2}
> compare to object
- a==(TextAnalyzer.new 'This is some text some some')
=> false
- a==(TextAnalyzer.new 'This some text some some')
=> true
> summing objects
- a2=a+a
> a.inspect
=> "#<TextAnalyzer words:5 unique:3>"
> a.to_s
=> "#<TextAnalyzer: This some text ...>"


