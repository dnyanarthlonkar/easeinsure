class UserMailer < ApplicationMailer
	def send_contact_email(contact_us)
		@contact_us = contact_us
		mail(to: ["chaitali.khangar@gmail.com"],#["contact@easeinsure.com","sales@easeinsure.com"],
		bcc: "chaitali.khangar@gmail.com",
		subject: "Contact Us Enquiry")
	end

	def send_claim_email(claim)
		@claim = claim
		mail(to: ["chaitali.khangar@gmail.com"], #["contact@easeinsure.com","sales@easeinsure.com"],
		bcc: "chaitali.khangar@gmail.com",
		subject: "Claim Assistance Enquiry")
	end
end