class CreateInsuranceTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :insurance_types do |t|
      t.string :name
      t.text :description
      t.integer :parent_id
      t.boolean :active, default: :true
      t.timestamps
    end
  end
end
