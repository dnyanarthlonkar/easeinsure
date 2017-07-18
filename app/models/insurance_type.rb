class InsuranceType < ApplicationRecord
	include Operations
	validates :name, presence: true
	validate :presence_of_description
	validates_length_of :name, maximum: 250
	validates_uniqueness_of :name
	acts_as_tree order: "name"
	before_save :generate_permalink
	after_save :reload_routes

	scope :roots, -> { where(parent_id: nil) }

	def presence_of_description
	  if self.parent_id.nil? && self.description.nil?
	  	errors.add(:description, "can't be blank")
	  end
	end

	def reload_routes
	    DynamicRouter.reload
	end

	def generate_permalink
		self.permalink = self.name.parameterize
	end
end
