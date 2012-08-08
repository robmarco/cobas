# encoding: UTF-8

module ApplicationHelper
	def days_until_response_text(days)
		case days
			when -1
				"<span class='flag green_flag'>Respondido</span>"
			when 0
				"<span class='flag red_flag'>Expirado</span>"
			when 1..5
				"<span class='flag orange_flag'>#{days} días</span>"
			else
				"<span class='flag yellow_flag'>#{days} días</span>"
		end
	end

	def days_until_response_sidebar(days)
		case days
			when -1
				"<span class='sidebar green_flag'>Respondido</span>"
			when 0
				"<span class='sidebar red_flag'>Expirado</span>"
			when 1..5
				"<span class='sidebar orange_flag'>#{days} días</span>"
			else
				"<span class='sidebar yellow_flag'>#{days} días</span>"
		end
	end

end
