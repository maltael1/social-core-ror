class User < ApplicationRecord
    before_create :encrypt_password
    has_many :sessions

    def encrypt_password
        self.password = Digest::MD5.hexdigest self.password
    end
end
