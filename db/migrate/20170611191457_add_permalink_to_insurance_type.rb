class AddPermalinkToInsuranceType < ActiveRecord::Migration[5.0]
  def change
    add_column :insurance_types, :permalink, :string
  end
end
