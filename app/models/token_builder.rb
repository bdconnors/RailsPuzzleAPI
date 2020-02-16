class TokenBuilder
  def self.encode(payload)
    @secret = Rails.application.secrets.secret_key_base
    JWT.encode(payload, @secret)
  end

  def self.decode(token)
    @secret = Rails.application.secrets.secret_key_base
    @decoded = JWT.decode(token, @secret)[0]
    HashWithIndifferentAccess.new(@decoded)
  rescue
    nil
  end
end
