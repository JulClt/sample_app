module ApplicationHelper

	def titre
		base_title = "Mon tutoriel Ruby On Rails"
		if @title.nil?
			base_title
		else
			"#{base_title} | #{@title}"
		end
	end

	def gravatar_for(user, options = {:size => 50})
		gravatar_image_tag(user.email.downcase, :alt => user.nom, 
												:class => "gravatar", 
												:gravatar => options)
	end

end
