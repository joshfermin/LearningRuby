class Dessert
  # Part 7
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