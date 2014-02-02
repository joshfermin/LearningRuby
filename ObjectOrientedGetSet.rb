class Class
	#http://paul-wong-jr.blogspot.com/2012/04/ruby-metaprogramming-with-classeval.html
	def attr_accessor_with_history(attr_name)
		attr_name = attr_name.to_s 				# make sure the attr name is a string
		attr_reader attr_name 					# this is the "getter"
    	attr_reader attr_name + "_history"		# create bar_history getter

    	# %Q is syntax for an interpolated string... it creates a string
    	# it will interpret Ruby Values as #{} 

    	# To store the history, use an array.
    	# put things into the array sequentially

    	# class eval is 
    	class_eval %Q(
		    		def #{attr_name}=(attr_name)
		    			@#{attr_name} = attr_name

		    			unless @#{attr_name + "_history"}
		    				@#{attr_name + "_history"} = []
		    				@#{attr_name + "_history"} << nil
		    			end

		    			@#{attr_name + "_history"} << attr_name
		    		end
		    		)
		# first set the value for the input
		# check if the array has been initialized yet...
			# if not, initialize it and add nil
		# else, insert the history
    end
end

class Foo
	attr_accessor_with_history :bar
end

f = Foo.new
f.bar = 3
f.bar = :wowzo
f.bar = 'boo!'
puts f.bar_history # => [nil, 3, :wowzo, 'boo!']

