# Write a function called glob_match(filenames, pattern), which takes an array of 
# filename strings and a glob pattern string and returns an array of the filenames 
# that match the following UNIX glob rules:

# *: matches zero or more characters,
# ?: marks the preceding character optional,

# [abc]: matches a, b, or c

# Ex: glob_match(
# [“part1.rb”, “part2.rb”, “part2.rb~”, “.part3.rb.un~”],
# “*part*rb?*”)

	# ==> [“part2.rb~”, “.part3.rb.un~”]

def glob_match(filenames, patterns)
	# Take the symbols of * or ? and change them to .* and . within the pattern
		# a*	Zero or more of a
	# Create a new Regexp class with patterns as the input
		# this will look like => /patterns/
	# Then select the filename, and see if it matches the rxp (regular expression)
		# =~ is the method that checks this
	patterns.gsub!(/[*?]/, '*' => '.*', '?' => '.')
	regex = Regexp.new(patterns)
	filenames.select do |filename|
		filename =~ regex
	end
end

p glob_match(
	["part1.rb", "part2.rb", "part2.rb~", ".part3.rb.un~", ".part4.rb.un"],
	"*part*rb?*")
