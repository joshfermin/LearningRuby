class Numeric

	@@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1}

	# goes all the way up to super class to see if there is a method missing
	# method_missing goes back to class Numeric and then looks and sees method missing
	# If there is an "s" at the end, then take it off, and see if you have the currency

	# what is unique about ruby? you can open any class at any time/ module.
	def method_missing(method_id)
		singular_currency = method_id.to_s.gsub( /s$/, '')
		if @@currencies.has_key?(singular_currency)
			self * @@currencies[singular_currency]
		else
	     	super
		end
	end

	def in(currency)
		raise 'Parameter is not a symbol' unless currency.kind_of? Symbol
		singular_currency = currency.to_s.gsub(/s$/,'')
		self * @@currencies[singular_currency]
	end
end

puts 5.dollar.in(:euros)
puts 10.euros.in(:rupees)