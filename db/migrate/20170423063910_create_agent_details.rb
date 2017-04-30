class CreateAgentDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :agent_details do |t|
      t.integer :code_number
      t.text :address
      t.string :contact_number
      t.string :designation
      t.integer :user_id
      t.timestamps
    end
  end
end
