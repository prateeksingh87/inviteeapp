class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    super
     @invitee =  Invite.find_by(referal_code: params[:referal_code])
     @invitee.update(:status=> "Accepted") if @invitee.present?
  end

  def update
    super
  end
end 