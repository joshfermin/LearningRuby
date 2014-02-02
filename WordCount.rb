class Word
	# Part3: Word Count
	def count_words(string)
		# Create a new hash
		# Split the words into an array separated by nonwords
		# Pipe each word to the hash 
		@count = Hash.new(0) 
		words = string.downcase.split(/\W+/)
		words.each {|word| @count[word] += 1}
		puts @count
	end
end	


count = Word.new
count.count_words("A man, a plan, a canal -- Panama")
count.count_words("Doo bee doo bee doo")
