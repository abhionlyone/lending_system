class CreateLoanRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :loan_requests do |t|
      t.belongs_to :user, foreign_key: true
      t.string :company_pan
      t.string :company_type
      t.string :annual_turn_over
      t.date :founding_date
      t.timestamps
    end
  end
end
