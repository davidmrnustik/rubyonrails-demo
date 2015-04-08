module PageHelper
	def nav_link_to (click_text, action, url, style)
		if action_name == action
			return link_to click_text, url, class: style
		else
			return link_to click_text, url
		end
	end

	def calendar( day_of_week, day_today, day_month )
	  months = [" ", "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    month_days = [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    t_today = []
    f_today = []
    x = 1
    day = day_today + 1
    
    while x < day_today
      t_today.push(x)
      x += 1
    end
    
    while day <= month_days[day_month]
      f_today.push(day)
      day += 1
    end
        
		cal = "<table class=\"calendar\">\n\t<tr>\n"
		days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
		day_of_week = day_of_week - 1
		days.each do |day|
			cal += "\t\t<td>#{day}</td>\n"
		end
		# Second row - first week of the month
		cal += "</tr>"
		cal += "<tr>"
		
		day_of_week.times do |day|
			cal += "<td>&nbsp;</td>"
		end
    
    cal += "<td>#{day_today}</td>"
		cal += "\t</tr>"
		cal += "</table>\n"
		cal += "<p>" + t_today.join(" ").to_s + "</p>"
		cal += "<p>" + f_today.join(" ").to_s + "</p>"
		
		return cal
	end
end
