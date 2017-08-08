class Proof < ApplicationRecord
  belongs_to :loan_request

  has_attached_file :pan
  validates_attachment_content_type :pan, content_type: ['image/jpeg', 'image/png', 'image/gif', 'application/pdf']

  has_attached_file :aadhar
  validates_attachment_content_type :aadhar, content_type: ['image/jpeg', 'image/png', 'image/gif', 'application/pdf']

  validates_attachment_presence :pan, :aadhar
end
