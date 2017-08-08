class CreateIntermediateSources < ActiveRecord::Migration[5.1]
  def change
    create_table :intermediate_sources do |t|
      t.string :name
      t.string :email
      t.string :pan_card_number
      t.string :mobile
      t.string :company_pan
      t.string :company_type
      t.string :annual_turn_over
      t.date :founding_date
      t.timestamps
    end
  end
end
