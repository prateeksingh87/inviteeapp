class InvitesController < ApplicationController
  before_action :set_invite, only: %i[ show ]


  def index
    @invites = current_user.invites
  end


  def new
    @invite = Invite.new
  end


 def create
    params[:invite][:address].split(",").each do |invite|
      @invite = current_user.invites.new(address: invite)
      @invite.save
      NotificationMailer.accept_mail(@invite).deliver_now
    end
    redirect_to invites_path
  end


  private
    def set_invite
      @invite = Invite.find(params[:id])
    end

    def invite_params
      params.require(:invite).permit(:address, :referal_code, :user_id)
    end
end
