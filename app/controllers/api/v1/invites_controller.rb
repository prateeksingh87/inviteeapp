class Api::V1::InvitesController < Api::V1::ApiController
    skip_before_action :verify_authenticity_token 
    before_action :authenticate

	def referal_email
	  @invite = current_user.invites.new(address: params[:address])
      if @invite.save
      	NotificationMailer.accept_mail(invite).deliver_now
        render json: {referal_email: params[:address], message: 'message sent to user' },status: 200
      end 	
	end

end
