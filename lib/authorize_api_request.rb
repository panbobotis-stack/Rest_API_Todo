class AuthorizeApiRequest
    def initialize(headers = {})
      @headers = headers
    end
  
    # Η μέθοδος που καλείται για να επιστρέψει τον χρήστη
    def call
      { user: user }
    end
  
    private
  
    attr_reader :headers
  
    def user
      # Ψάχνει τον χρήστη στη βάση με βάση το ID που κρύβεται στο Token
      @user ||= User.find(decoded_auth_token[:user_id]) if decoded_auth_token
    rescue ActiveRecord::RecordNotFound => e
      # Αν το Token έχει ID που δεν υπάρχει πια
      raise(StandardError, "Invalid token: #{e.message}")
    end
  
    # Αποκωδικοποιεί το Token χρησιμοποιώντας την υπηρεσία JsonWebToken
    def decoded_auth_token
      @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
    end
  
    # Παίρνει το Token από το Header της αίτησης (Authorization: Bearer <token>)
    def http_auth_header
      if headers['Authorization'].present?
        return headers['Authorization'].split(' ').last
      end
      raise(StandardError, "Missing token")
    end
  end