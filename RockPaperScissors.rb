
class WrongNumberOfPlayersError <  StandardError ; end
class NoSuchStrategyError <  StandardError ; end

class RPS
	# Part4a: Game Winner
	def rps_game_winner(game)
		# make sure there are only 2 players, if not raise an error
		raise WrongNumberOfPlayersError unless game.length == 2

		a = game[0][1]
		b = game[1][1]

		# make sure that there are actually rock paper and scissors
		raise NoSuchStrategyError unless a and b == "R" or "P" or "S"

		# Give all the possibilities for p2 to beat p1 and set that to 1 use to index to winner
		rules = {["S", "R"] => 1, ["P", "S"] => 1, ["R", "P"] => 1}

		# The rest of the possibilities will be draws/p1 beats p2 set to 0 use to index to winner
		rules.default = 0

		# Get first players choice
		# Get second players choice
		# Call rules on those two upcased element and print
			# If p2 beats p1 -> game[1] which will be the winner (p2)
			# If p1 beats p2 -> game[0] which will be the winner (p1)
		return game[rules[[game[0][1].upcase,game[1][1].upcase]]]
	end

	# Part4b: Tournament Winner 
		# From: https://gitcafe.com/oppih/SaaS_hw/blob/master/hw1/p2_rock_paper_scissors.rb
	def rps_tournament_winner(tournament)
		if tournament[0][0].is_a?(Array)
			tournament = rps_tournament_winner(
				[rps_tournament_winner(tournament[0]),
				rps_tournament_winner(tournament[1])]
				)
		else
			rps_game_winner(tournament)
		end
	end
end

tournament1 = [
    [

        [ ["Armando", "P"], ["Dave", "S"] ],

        [ ["Richard", "R"],  ["Michael", "S"] ],

    ],
    [
        [ ["Allen", "S"], ["Omer", "P"] ],

        [ ["David E.", "R"], ["Richard X.", "P"] ]
    ]
]


match = RPS.new
p match.rps_game_winner([ ["Armando", "P"], ["Dave", "S"] ])
p match.rps_tournament_winner(tournament1)




