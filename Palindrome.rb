class Word
	# Part2: Palindrome
	def palindrome?(string)
	    # \W matches all non word charcters. 
	    # gsub takes in two parameters, the things you want to change and then what you want to change them into
	    # downcase 
	    @isPalindrome = string.downcase.gsub(/\W/, '') == string.downcase.gsub(/\W/, '').reverse
	    puts @isPalindrome
	end
end

w = Word.new
w.palindrome?("A man, a plan, a canal -- Panama")
w.palindrome?("Madam, I'm Adam!")
w.palindrome?("Abracada")