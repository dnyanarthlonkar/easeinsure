class InsuranceCompany < ApplicationRecord
   mount_uploader :logo, LogoUploader
   validates :company_name, :licence_no,:company_code, :company_address, :contact_number, 
      	:registration_code, :authorised_person_name, :authorised_person_contact_number, :authorised_person_contact_email, :designation, presence: true
end
