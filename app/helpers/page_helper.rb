module PageHelper
	def nav_link_to (click_text, action, url, style)
		if action_name == action
			return link_to click_text, url, class: style
		else
			return link_to click_text, url
		end
	end

	def calendar( day_of_week )
		cal = "<table class=\"calendar\">\n\t<tr>\n"
		days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
		days.each do |day|
			cal += "\t\t<td>#{day}</td>\n"
		end
		# Second row - first week of the month
		cal += "<tr>"
		day_of_week.times do |day|
			cal += "<td>&nbsp;<td>"
		end

		cal += "\t</tr>"
		cal += "\t</tr>\n</table>\n"
		return cal
	end
end
