class NewCommentEmailWorker
	@queue = :emails
	def self.perform(comment_id)
		puts("sending email comment")
		UserMailer.new_comment(comment_id).deliver_now
	end
end