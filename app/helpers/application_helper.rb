module ApplicationHelper

	def titre
		base_title = "Mon tutoriel Ruby On Rails"
		if @title.nil?
			base_title
		else
			"#{base_title} | #{@title}"
		end
	end

end
