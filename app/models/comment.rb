class Comment < ApplicationRecord
	belongs_to :user
	belongs_to :post
	has_many :likes, dependent: :destroy, as: :liked

	def user_can_like(user_id)
		if self.likes.where(user_id: user_id).length > 0
			return false
		end
		return true
	end

	def like_status_string(user_id)
		if self.user_can_like(user_id)
			return '<i class="fa fa-thumbs-up"></i>'.html_safe
		else
			return '<i class="fa fa-thumbs-down"></i>'.html_safe
		end
	end
end
