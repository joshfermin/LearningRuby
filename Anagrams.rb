class Word
# Part5: Anagrams
	def combine_anagrams(words)
		# Split each string into an array of characters
		# take those arrays and group by equivalent arrays
		# downcase each, and then do .values
		# to return each variable as an array
		@anagrams = words.group_by {|element| element.downcase.chars.sort}.values
		print @anagrams
    end
end

anagram = Word.new
anagram.combine_anagrams(['cars', 'for', 'potatoes', 'racs', 'four', 'scar', 'creams', 'scream'])
