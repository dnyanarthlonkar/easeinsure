module Operations
	extend ActiveSupport::Concern
	def soft_delete
		self.update(active: false)
	end
end