class CreateContactUs < ActiveRecord::Migration[5.0]
  def change
    create_table :contact_us do |t|
      t.string :contact_type
      t.string :name
      t.string :phone
      t.string :type_of_insurance
      t.string :prefer_call_time
      t.string :email
      t.text :comments

      t.timestamps
    end
  end
end
