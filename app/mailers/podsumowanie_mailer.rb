class PodsumowanieMailer < ApplicationMailer
	
	def end_mail

		mail(to: 'raf.szlachetka@gmail.com', subject: "SERWIS - podsumowanie - #{params[:line_num]}")
	end

	def pending_cases_mail


	end

	def raport

		end_mail
	end

	def week_summary

		@ss = Service.all
		
		mail(to: 'raf.szlachetka@gmail.com', subject: "SERWIS - podsumowanie tygodnia")
	end

	def edycja_pozycji

	end
end