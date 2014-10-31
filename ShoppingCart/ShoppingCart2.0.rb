require 'date'

class TimeCalculator

	def self.getSeason
		yearDay = self.getYearDay

		#invierno
		if(yearDay>0 && yearDay <81)
			return 3
		end

		#primavera
		if(yearDay>=81 && yearDay <172)
			return 0
		end

		#verano
		if(yearDay>=173 && yearDay <263)
			return 1
		end
		
		#otoño
		if(yearDay>=264 && yearDay <365)
			return 2
		end

	end

	def self.getWeekDay
		Time.now.wday
	end

	def self.getYearDay
		Date.today.yday
	end

end

class TablePrices 

	@@prices = {
		:apple => [10, 10, 15, 12],
		:orange => [5, 2, 5, 5],
		:grape => [15, 15, 15, 15],
		:banana => [20, 20, 20, 21],
		:watermelon => [50, 50, 50, 50]
	}

	def getPrice item
		@@prices[item][TimeCalculator.getSeason]

	end

end

class DealCalculator
	def calculateDeals itemList
		dealList = [
			AppleDeal.new,
			OrangeDeal.new,
			GrapeDeal.new,
			WatermelonDeal.new
		]

		dealList.each do |deal|
			deal.calculateDeal itemList

		end
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

		@deal_calculator.calculateDeals @item_list

		@item_list.each do |fruit, times|
			total += (@t_prices.getPrice fruit) * times
		end
		total
		
	end
end

class AppleDeal

	def calculateDeal itemList
		if itemList[:apple] > 1
			itemList[:apple] = (itemList[:apple]/2.0).round
		end
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

class WatermelonDeal
	def calculateDeal itemList
		if(TimeCalculator.getWeekDay == 7)
			itemList[:watermelon] = itemList[:watermelon] * 2
		end

	end
end

sc = ShoppingCart.new TablePrices.new , DealCalculator.new
sc.add :watermelon

puts sc.cost


