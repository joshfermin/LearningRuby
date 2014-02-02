class String
	# Part10a: Palindrome
	def palindrome?
		# add to string class
	    # \W matches all non word charcters. 
	    # gsub takes in two parameters, the things you want to change and then what you want to change them into
	    # main idea here is to take away the (string) parameter and replace it with self 
	    @isPalindrome = self.downcase.gsub(/\W/, '') == self.downcase.gsub(/\W/, '').reverse
	    puts @isPalindrome
	end
end

module Enumerable
	#Part 10b: Palindromes again
	def palindrome?
	   # take out gsub/downcase 
	   # add to array class
	   # main idea here is to take away the (string) parameter and replace it with self 
	    @isPalindrome = self == self.reverse
	    puts @isPalindrome
	end
end

"foo".palindrome?
"fof".palindrome?

[1,2,3,2,1].palindrome?
[1,2,3,4,5].palindrome?