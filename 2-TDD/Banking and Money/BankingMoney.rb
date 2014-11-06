class BankingMoney
	TO_EURO = {
		usd: 0.77818,
		gbp: 1.27341,
		cad: 0.70518,
		aud: 0.69052
	}

	FROM_EURO = {
		usd: 1.28356,
		gbp: 0.78478,
		cad: 1.41613,
		aud: 1.44651
	}

	def convert amount, from_currency, to_currency
		if is_same_currency? from_currency, to_currency
			return amount
		else
			if is_euro_from_currency? from_currency
				return amount * FROM_EURO[to_currency].to_f
			elsif is_euro_to_currency? to_currency
				return amount * TO_EURO[from_currency].to_f
			else
				aux = convert amount, from_currency, :eur
				return (convert aux, :eur, to_currency).round(5)
			end

		end
	end

	def is_same_currency? from, to
		from == to
	end

	def is_euro_from_currency? from
		from == :eur
	end

	def is_euro_to_currency? to
		to == :eur
	end

end