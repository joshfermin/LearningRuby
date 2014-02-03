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

    	# eval only takes a string to evaluate
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

# class_eval has a number of advantages over simply reopening the class. 
# Firstly, you can easily call it on a variable, and it's 
# clear what your intent is. Another advantage is that it will fail if 
# the class doesn't exist. So the example below will fail as Array is 
# spelt incorrectly. If the class was simply reopened, it would succeed 
# (and a new incorrect Aray class would be defined):

# class String
#   def lowercase
#     self.downcase
#   end
# end

# String.class_eval do
#   def lowercase
#     self.downcase
#   end
# end

# In each case, the String class has been reopened and a
# new method defined. That method is available across all instances 
# of the class