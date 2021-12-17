class Invite < ApplicationRecord

   belongs_to :user

   after_create :generate_referal_code

   def generate_referal_code
      @referal_code = SecureRandom.hex(10)
      self.referal_code = @referal_code
      self.save
   end


end
