load 'analyze.rb'
puts 'write how many elements to show'; q=gets
red_cap = File.open("text.txt") 
	include Analyze
	content =  red_cap.read
	#tab = content.downcase.gsub /[^a-z]/, ' ' #/[\.,\"]/, ' '
	tab = get_words content
	
	#tab2 = tab.split(' ').map{|x| x.to_sym}
	tab2 = slice_to_symbols tab
	
	#unique = tab2.uniq
	#count = unique.map {|x| tab2.count x}
	unique, count = count_occurrences tab2
	
	#zipped = (unique.zip count).sort {|x, y| y[1]<=>x[1]}
	#count = []
	#unique = []
	#zipped.each{|x| unique << x[0] }
	#zipped.each{|x| count <<  x[1] }
	unique, count, zipped = sort_words unique, count

	h = Hash[zipped]
	h.map {|k, v| puts "#{k} - #{v}" }
	puts h.select {|k, v| v > 10}

	#p h.values_at *unique[0..q.to_i]
	p values_from_list h, unique, q.to_i
	
red_cap.close