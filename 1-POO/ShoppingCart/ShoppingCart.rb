class TablePrices 

	@@prices = {
		:apple => 10,
		:orange => 5,
		:grape => 15,
		:banana => 20,
		:watermelon => 50
	}

	def getPrice item
		@@prices[item]
	end

end

class DealCalculator
	def initialize on
		@on = on
	end

	def calculateDeals itemList
		itemList.each do |fruit, times|

			fruit == :apple ? d = AppleDeal.new : false
			fruit == :orange ? d = OrangeDeal.new : false
			fruit == :grape ? d = GrapeDeal.new : false

			if d != nil
				d.calculateDeal itemList
			end

		end

	end

	def isOn?
		return @on
	end
end

class ShoppingCart
	def initialize tablePrices, dealCalculator
		@t_prices = tablePrices
		@deal_calculator = dealCalculator
		@item_list = Hash.new (0)
	end

	def add *item
		item.each do |i|
			@item_list[i] +=1
		end
	end

	def cost 
		total = 0
		if @deal_calculator.isOn?
			@deal_calculator.calculateDeals @item_list
		end

		@item_list.each do |fruit, times|
			total += (@t_prices.getPrice fruit) * times
		end

		total
		
	end
end


class AppleDeal

	def calculateDeal itemList

		itemList[:apple] = (itemList[:apple]/2).floor
	end

end

class OrangeDeal
	def calculateDeal itemList
		oranges = itemList[:orange]
		if(oranges > 2)
			aux = (oranges/3).floor
			itemList[:orange] = aux * 2
		end
	end
end

class GrapeDeal
	def calculateDeal itemList
		grapes = itemList[:grape]
		if(grapes > 3)
			aux = (grapes/4).floor
			itemList[:banana] -= aux
			itemList[:banana] < 0 ? itemList[:banana] =0 : false
		end
	end
end


sc = ShoppingCart.new TablePrices.new ,(DealCalculator.new true)
sc.add :orange ,:orange,:orange,:orange,:orange,:orange, :banana, :watermelon

puts sc.cost


