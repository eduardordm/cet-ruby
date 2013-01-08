require 'Date'

class Cet

  MAX_CET = 10000.00

	def self.mensal(fc0, fcj, n, d0, dj0)

		fc0 = fc0.to_f
		fcj = fcj.to_f

		dn = dj0 >> n
		dias = (dn - dj0).to_i

		cet = 0

		while true

			total = 0.0 

			n.times do |j|		
				expo = j+1
				v = fcj / (( 1.0 + cet) ** expo) 
				total = total + v
			end

			cet = cet + 0.00001

			if cet >= MAX_CET
				cet = -1
				break
			end

			if total - fc0 <= 0
				break
			else
				cet = (cet  * (total / fc0).to_f )
			end
		end

		cet*100.0

	end


	def self.anual(fc0, fcj, n, d0, dj0)

		fc0 = fc0.to_f
		fcj = fcj.to_f
		
		dn = dj0 >> n
		dias = (dn - dj0).to_i

		cet = 0

		while true

			total = 0.0 

			n.times do |j|
				dj = j == 0 ? dj0 : dj0 >> j 
				expo = (dj - d0)/365.0
				v = fcj / (( 1.0 + cet) ** expo) 
				total = total + v
			end

			cet = cet + 0.00001

			if cet >= MAX_CET
				cet = -1
				break
			end

			if total - fc0 <= 0
				break
			else
				cet = cet * (total / fc0).to_f
			end
		end

		cet*100.0

	end
end
