class UserMailer < ApplicationMailer

	def new_comment(comment_id)
		@comment = Comment.find(comment_id);
		email_to = @comment.post.user.email;
		mail(
			to: email_to,
			subject: "New comment on your post by " + @comment.user.email + "  !"
		)
	end


end

