=begin
	Name: ShoppingCart
	Description:  Program that provides us with a ShoppingCart class that helps us to calculate the price of things that we are buying.
	Created by: Joaquín Rodríguez
	Date: 23/10/2014
=end

class Item

	def initialize(name, price, kind)
		@name = name
		@price = price
		@kind = kind
	end

	def getName()
		@name
	end
	
	def getPrice()
		@price
	end

	def discount(sCart, category)
		day = Time.now.wday
		discount = 1
		if (@kind == "Fruit" && (day==6 || day==7))
			#Descuento del 10%
			discount -= 0.1
		end

		if @kind == "Housewares" && @price > 100
			#Descuento del 5%			
			discount -= 0.05
		end

		cont = 0
		sCart.each{|x| cont += x}

		if(cont>5 && category == 'Extra-loyal')
			#descuento del 10%
			discount -= 0.1
		end

		discount
	end
end

products = [
	Item.new("Bananas", 10, "Fruit"),
	Item.new("Orange Juice", 10, "Juice"),
	Item.new("Rice", 1, "Cereal"),
	Item.new("Vacuum Cleaner", 150, "Housewares"),
	Item.new("Anchovies", 2, "Preserves"),
]

categories = [
	"Normal",
	"Extra-loyal"
]

continue = true 
shoppingCart = Array.new(products.size, 0)
c = 0

system('clear')

puts "My Shopping Cart"
puts "================"

puts "\nHi, what's your name? "	
cName = gets.chomp


while continue
	puts "\nWhat kind of customer are your? (select a number)"	
	categories.each_with_index{|a,i|puts "#{i+1}: #{a}"}
	opcion = gets.chomp.to_i

	if(opcion<1 || opcion>categories.size)
		puts "Sorry, that category is not valid."
	else
		cCategory = categories[opcion-1]
		continue = false
	end
end


continue = true

while continue
	system('clear')

	puts "My Shopping Cart"
	puts "================"

	products.each_with_index{|a,i|puts "#{i+1}: #{a.getName}"}
	puts "> #{products.size+1}: End Shopping"

	puts "\nSelect what you want to buy (items-> #{c}): "	
	opcion = gets.chomp.to_i

	if(opcion>=1 && opcion<=products.size)
		shoppingCart[opcion-1] += 1
		c +=1
	end

	if opcion == 6
		continue = false
	end

end

system('clear')
puts "Your shoppingCart is:\n"
puts "=====================\n\n"
puts "ITEM \t\t UNITS \t PRICE(u)  PRICE   DISCOUNT   TOTAL\n\n"

total = 0
shoppingCart.each_with_index{|item, i|
	if(shoppingCart[i] >0)
		discount = products[i].discount(shoppingCart, cCategory)
		aux = products[i].getPrice*shoppingCart[i] * discount
		total += aux
		
		printf("%-17s %2s  %8s€ %6s€      %4s%%  %6s€\n", products[i].getName, shoppingCart[i], products[i].getPrice , products[i].getPrice*shoppingCart[i], 100- discount * 100, aux)
	end
}
puts "____________________________________________________________"
puts "\n\t\t\t#{cName}, you have to pay #{total.round(2)}€\n\n"








