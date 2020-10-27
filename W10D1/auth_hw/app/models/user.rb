class User < ApplicationRecord

    attr_reader :password

    validates :username, presence: true
    validates :session_token, presence: true
    validates :password_digest, presence: { message: "Password cannot be blank" }
    validates :password, length: { minimum: 6, allow_nil: true }
    # after_initialize :ensure_session_token

    def find_by_credentials(username, password)
    end

    def generate_session_token
    end

    def reset_session_token!
    end

    def ensure_session_token
    end

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end
    

end
