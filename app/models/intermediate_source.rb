class IntermediateSource < ApplicationRecord
  has_one :intermediate_source_proof, dependent: :destroy

  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  def user_fields
    as_json(only: ["email","name", "pan_card_number", "mobile"])
  end

  def company_fields
    as_json(only: ["company_pan","annual_turn_over", "company_type", "founding_date"])
  end
end
