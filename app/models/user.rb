class User < ActiveRecord::Base
	attr_reader :password

	validates :email, :password_digest, :session_token, presence: true
	validates :email, :session_token, uniqueness: true
	validates :password, length { minimum: 6, allow_nil: true }
	after_initialize :set_session_token

	def password=(password)
		@password = password
		self.password_digest = BCrypt::Password.create(password)
	end

	def is_password?(password)
		BCrypt::Password.new(self.password_digest).is_password?(password)
	end

	private

	def set_session_token
		self.session_token ||= SecureRandom::urlsafe_base64(16)
	end
end
