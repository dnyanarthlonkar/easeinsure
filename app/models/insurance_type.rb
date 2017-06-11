class InsuranceType < ApplicationRecord
	include Operations
	validates :name, :description, presence: true
	validates_length_of :name, maximum: 250
	validates_uniqueness_of :name
	acts_as_tree order: "name"
	before_save :generate_permalink
	after_save :reload_routes

	scope :roots, -> { where(parent_id: nil) }

	def reload_routes
	    DynamicRouter.reload
	end

	def generate_permalink
		self.permalink = self.name.parameterize
	end
end
