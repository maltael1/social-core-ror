class User < ApplicationRecord
    before_create :set_password_and_token

    def set_password_and_token
        loop do
            self.token = SecureRandom.hex
            return token unless User.exists?({token: self.token})
        end
        self.password = Digest::MD5.hexdigest(self.password)
    end
end
