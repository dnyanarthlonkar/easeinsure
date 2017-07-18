class HomeController < ApplicationController
  def dashboard
  	@insurance_types = InsuranceType.roots.decorate
  end

  def contact_us
  	@contact_us_by_phone = @contact_us_by_email = ContactUs.new
  end
  	
	def save_contact
		contact_us = ContactUs.new(permit_contact)
		if contact_us.save
			UserMailer.send_contact_email(contact_us).deliver
			flash[:notice] = "Thank you for contacting us. We will get back to you soon."
			redirect_to root_path
		else
			@contact_us_by_phone = contact_us.contact_type == "By Phone" ? contact_us : ContactUs.new 
			@contact_us_by_email = contact_us.contact_type == "By Email" ? contact_us : ContactUs.new
			flash[:contact_errors] = contact_us.errors.full_messages.to_sentence(last_word_connector: " and ",words_connector: " , ")
			render "contact_us"
		end
	end
	
	private
	def permit_contact
	  params.require(:contact_us).permit(:name,:phone,:type_of_insurance,:prefer_call_time, :email, :comments,:contact_type)
	end

end
