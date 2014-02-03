class CartesianProduct

    include Enumerable

    def initialize(a,b)
    	@product = []
    	@product = a.product(b) unless b.empty?
    end

    def each(&block)
    	@product.each{|element| yield element}
  	end
end

c = CartesianProduct.new([:a,:b], [4,5])
c.each {|elt| puts elt.inspect }

c = CartesianProduct.new([:a,:b], [])
c.each { |elt| puts elt.inspect }

# Blocks, allow you to inject code into a method. 
# yield takes whatever what is in the block and puts it inside
