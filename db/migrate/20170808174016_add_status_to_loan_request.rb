class AddStatusToLoanRequest < ActiveRecord::Migration[5.1]
  def change
    add_column :loan_requests, :status, :string, default: 'pending'
  end
end
