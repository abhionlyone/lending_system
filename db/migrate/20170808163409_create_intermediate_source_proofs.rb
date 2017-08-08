class CreateIntermediateSourceProofs < ActiveRecord::Migration[5.1]
  def change
    create_table :intermediate_source_proofs do |t|
      t.belongs_to :intermediate_source, foreign_key: true

      t.timestamps
    end
  end
end
