module PageHelper
	def nav_link_to (click_text, action, url, style)
		if action_name == action
			return link_to click_text, url, class: style
		else
			return link_to click_text, url
		end
	end

	def calendar( month, year )
		current_date = Date.new(year, month, 1)

		prev_month = month - 1
		prev_year = year
		if(prev_month <= 0)
			prev_month = 12
			prev_year = year - 1
		end

		next_month = month + 1
		next_year = year
		if(next_month >= 12)
			next_month = 1
			next_year = year + 1
		end

		cal = "" # this forced to be a following line a normal string
		cal += link_to("Prev", calendar_path(:month=>prev_month, :year=>prev_year))
		cal += " "
		cal += link_to("Next", calendar_path(:month=>next_month, :year=>next_year))
		cal += current_date.strftime("%B")
        day_of_week = current_date.strftime("%w").to_i
		cal += "<table class=\"calendar\">\n\t<tr>\n"
		days = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
		days.each do |day|
			cal += "\t\t<td>#{day}</td>\n"
		end
		# Second row - first week of the month
		cal += "</tr>"
		cal += "<tr>"
		
		day_of_week.times do
			cal += "<td></td>"
		end

		# Print the days of week starting with 1
		(7 - day_of_week).times do |day|
			cal += "<td>#{day + 1}</td>"
		end

		cal += "</tr>"
		cal += "<tr>"

		# Loop to do the in-between rows
		

		# Final loop to do the last row
    	

		cal += "\t</tr>"
		cal += "</table>\n"
		cal += "Month: #{month}<br />Year: #{year}<br/>"
		cal += "Date:#{current_date}<br/>"
		cal += day_of_week.to_s
		
		return cal
	end
end
