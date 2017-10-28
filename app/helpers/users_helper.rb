module UsersHelper

	def current_round(user)
    if Response.all.where(:user_id => user, :correct => true).any?

      correct_rounds = Response.all.where(:user_id => user, :correct => true)
      correct_rounds.maximum("round_number") + 1
    else
      0
    end
  end


  # Returns the Gravatar for the given user.

  def gravatar_for(user, options = { size: 80 })


    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)

    size = options[:size]

    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"

    image_tag(gravatar_url, alt: user.name, class: "gravatar")

  end

end
