class ContactUs < ApplicationRecord
	validates_presence_of :name, :email, :type_of_insurance

	validates_presence_of :phone , :if => lambda { self.contact_type == "By Phone"}
	validates_presence_of :prefer_call_time , :if => lambda { self.contact_type == "By Phone"}
	validates :phone, :phone_number => {:ten_digits => true,:format => /\d{10}/,:allow_nil => true,:message => "invalid and be only 10 digit number"}

	before_validation :save_contact_type


	def type_by_email?
		self.contact_type.present? && self.contact_type == "By Email"
	end

	def type_by_phone?
		self.contact_type.present? && self.contact_type == "By Phone"
	end

	private
	def save_contact_type
		self.contact_type = self.prefer_call_time? ? "By Phone" : "By Email" 
	end
end
