class AddFieldsToIntermediateSourceProof < ActiveRecord::Migration[5.1]
  def up
    add_attachment :intermediate_source_proofs, :pan
    add_attachment :intermediate_source_proofs, :aadhar
  end

  def down
    remove_attachment :intermediate_source_proofs, :pan
    remove_attachment :intermediate_source_proofs, :aadhar
  end
end
