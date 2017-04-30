class CreateInsuranceCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :insurance_companies do |t|
      t.string :company_name
      t.string :licence_no
      t.string :company_code
      t.text :company_address
      t.string :contact_number
      t.string :registration_code
      t.string :logo
      t.string :authorised_person_name
      t.string :authorised_person_contact_number
      t.string :authorised_person_contact_email
      t.string :designation
      t.boolean :status
      t.timestamps
    end
  end
end
