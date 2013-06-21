module Analyze
	def values_from_list hash, key_list, quantity
		hash.values_at *key_list[0..quantity]
	end
	def get_words text
		text.downcase.gsub /[^a-z]/, ' ' #/[\.,\"]/, ' '
	end
	
	def count_occurrences arr
		unique = arr.uniq
		return unique, (unique.map {|x| arr.count x})
	end
	
	
	def sort_words unique, count
		zipped = (unique.zip count).sort {|x, y| y[1]<=>x[1]}
		count = []
		unique = []
		zipped.each{|x| unique << x[0] }
		zipped.each{|x| count <<  x[1] }
		return unique, count, zipped
	end
	def slice_to_symbols text
		text.split(' ').map{|x| x.to_sym}
	end
	def count_words arr
		arr.length
	end
	def word_count arr, symbol
		arr.count symbol
	end
	
	def percentage arr, symbol
		c = count_words arr
		w = word_count arr, symbol
		return w.to_f/c
	end
	
	#percentages of array of symbols
	def percentages arr, symbol_array
		per = []
		symbol_array.each{|x| per<< (percentage arr, x)}
		per
	end

end
