class Session < ApplicationRecord
    
    belongs_to :user
    before_create :encrypt_token

    def encrypt_token 
        self.token = Digest::MD5.hexdigest self.token
    end

    def deactivate
        is_active = false
        save!
    end
end
