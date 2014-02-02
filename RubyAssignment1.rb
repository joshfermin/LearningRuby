# Part1: Hello World
class HelloWorldClass
    def initialize(name)
       @name = name.capitalize
    end
    def sayHi
        puts "Hello #{@name}!"
    end
end
hello = HelloWorldClass.new("Josh")
hello.sayHi

class Word
	# Part2: Palindrome
	def palindrome?(string)
	    # \W matches all non word charcters. 
	    # gsub takes in two parameters, the things you want to change and then what you want to change them into
	    # downcase 
	    @isPalindrome = string.downcase.gsub(/\W/, '') == string.downcase.gsub(/\W/, '').reverse
	    puts @isPalindrome
	end

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

	# Part5: Anagrams
	def combine_anagrams(words)
		# Group array of words into a hash (words.group_by)
		# take each element in array, and downcase/sorts the elements
		@anagrams = words.group_by {|element| element.downcase.chars.sort}.values
		print @anagrams
    end

end

w = Word.new
w.palindrome?("A man, a plan, a canal -- Panama")
w.palindrome?("Madam, I'm Adam!")
w.palindrome?("Abracada")

count = Word.new
count.count_words("A man, a plan, a canal -- Panama")
count.count_words("Doo bee doo bee doo")

anagram = Word.new
anagram.combine_anagrams(['cars', 'for', 'potatoes', 'racs', 'four', 'scar', 'creams', 'scream'])




class WrongNumberOfPlayersError <  StandardError ; end
class NoSuchStrategyError <  StandardError ; end

class RPS
	# Part4a: Game Winner
	def rps_game_winner(game)
		# make sure there are only 2 players, if not raise an error
		raise WrongNumberOfPlayersError unless game.length == 2

		# make sure there are valid strategies
		a = game[0][1]
		b = game[1][1]
		raise NoSuchStrategyError unless a and b == "R" or "P" or "S"

		# Give all the possibilities for p2 to beat p1 and set that to 1 use to index to winner
		rules = {["S", "R"] => 1, ["P", "S"] => 1, ["R", "P"] => 1}

		# The rest of the possibilities will be draws/p1 beats p2 set to 0 use to index to winner
		rules.default = 0

		# Access the first element in game and get their choice
		# Access the second element in game and get their choice
		# Call rules on those two upcased element and print
			# If p2 beats p1 then it will call game[1] which will be the winner (p2)
			# If p1 beats p2 then it will call game[0] which will be the p1
		return print game[rules[[game[0][1].upcase,game[1][1].upcase]]]
	end

	# Part4b: Tournament Winner
	# def rps_tournament_winner(tournament)
	# 	return rps_game_winner(tournament) if tournament.first.first.class == String
	# 	player1 = rps_tournament_winner(tournament[0])
	# 	player2 = rps_tournament_winner(tournament[1])
	# 	rps_game_winner([player1],[player2])
	# end
end

# tournament1 = [
#     [

#         [ ["Armando", "P"], ["Dave", "S"] ],

#         [ ["Richard", "R"],  ["Michael", "S"] ],

#     ],
#     [

#         [ ["Allen", "S"], ["Omer", "P"] ],

#         [ ["David E.", "R"], ["Richard X.", "P"] ]
#     ]
# ]

match = RPS.new
match.rps_game_winner([ ["Armando", "P"], ["Dave", "S"] ])
# match.rps_tournament_winner(tournament1)

class Dessert
  attr_accessor :name
  attr_accessor :calories
  def initialize(name, calories)
      @name=name
      @calories=calories
  end
  
  def healthy?
     @calories<200 
  end
   
  def delicious?
    return true
  end
end

b=Dessert.new("cake",190)
puts b.delicious?
puts b.healthy?

class JellyBean < Dessert
	attr_accessor :flavor
    def initialize(name, calories, flavor)
        @name=name
        @calories=calories
        @flavor=flavor
    end

    def delicious?
        if @flavor == "black licorice"
          false
        else
          true
        end
    end
end

a=JellyBean.new("jellybean",232,"black licorice")
puts a.delicious?
puts a.healthy?
















