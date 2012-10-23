module ApplicationHelper

	# Returns the full title on a per-page baseis.
	def full_title(page_title)
		base_title = "Fables"
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end
end
