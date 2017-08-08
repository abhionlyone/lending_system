class AddFieldsToProof < ActiveRecord::Migration[5.1]
  def up
    add_attachment :proofs, :pan
    add_attachment :proofs, :aadhar
    add_reference :proofs, :loan_request, index: true
  end

  def down
    remove_attachment :proofs, :pan
    remove_attachment :proofs, :aadhar
  end
end
