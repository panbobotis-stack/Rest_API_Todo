class JsonWebToken
    # Το μυστικό κλειδί της εφαρμογής για την υπογραφή των tokens
    SECRET_KEY = Rails.application.secret_key_base
  
    # Δημιουργία Token
    def self.encode(payload, exp = 24.hours.from_now)
      payload[:exp] = exp.to_i
      JWT.encode(payload, SECRET_KEY)
    end
  
    # Αποκωδικοποίηση Token
    def self.decode(token)
      body = JWT.decode(token, SECRET_KEY)[0]
      HashWithIndifferentAccess.new body
    rescue
      nil
    end
  end