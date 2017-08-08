class LoansController < ApplicationController

  before_action :set_source, only: [:collect_company_info, :complete_process]
  before_action :authenticate_user!, only: :loan_request

  def index
    @intermediate_source = IntermediateSource.where(id: session[:source_id]).first || IntermediateSource.new
  end

  def collect_user_info
    @intermediate_source = IntermediateSource.where(id: session[:source_id]).first || IntermediateSource.new(user_info_params)
    respond_to do |format|
      if @intermediate_source.save && !User.where(email: @intermediate_source.email).first
        session[:source_id] = @intermediate_source.id
        format.js
      else
        format.js {render js: 'swal("A request is already submitted with this email!");'}
      end
    end
  end

  def loan_request
  end

  def collect_company_info
    @intermediate_source.update_attributes(company_info_params)
    @proof = @intermediate_source.intermediate_source_proof || @intermediate_source.build_intermediate_source_proof
    respond_to do |format|
      if @intermediate_source.save
        format.js
      else
        format.js
      end
    end
  end

  def complete_process
    @proof = @intermediate_source.intermediate_source_proof || @intermediate_source.build_intermediate_source_proof
    @proof.update_attributes(update_proofs_params)
    respond_to do |format|
      if @proof.save!
        user = User.invite!(@intermediate_source.user_fields)
        loan_request = user.create_loan_request(@intermediate_source.company_fields)
        loan_request.save
        proof = loan_request.create_proof
        proof.pan = @proof.pan
        proof.aadhar = @proof.aadhar
        proof.save
        @intermediate_source.destroy
        session[:source_id] = nil
        sign_in(:user, user)
        format.js
      else
        format.js
      end
    end
  end

  protected

  def set_source
    @intermediate_source = IntermediateSource.find(session[:source_id])
  end

  def user_info_params
    params.require(:intermediate_source).permit(:name, :email, :pan_card_number, :mobile)
  end

  def company_info_params
    params.require(:intermediate_source).permit(:company_pan, :company_type, :annual_turn_over, :founding_date)
  end

  def update_proofs_params
    params.require(:intermediate_source_proof).permit(:pan, :aadhar)
  end
end
