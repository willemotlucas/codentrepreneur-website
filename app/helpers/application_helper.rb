module ApplicationHelper
	def gravatar_url(user, size)
		gravatar_id = Digest::MD5::hexdigest(user.email).downcase
		"https://www.gravatar.com/avatar/#{gravatar_id}.jpg?d=identicon&s=#{size}"
	end
end
