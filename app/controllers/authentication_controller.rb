class AuthenticationController < ApplicationController
    # Αυτό επιτρέπει την εγγραφή χωρίς Token (αφού τώρα φτιάχνουμε τον χρήστη)
    skip_before_action :authorize_request, only: [:signup, :login]
  
    def signup
      user = User.create!(user_params)
      render json: { message: "User created successfully" }, status: :created
    end

  # POST /auth/login
  def login
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      # Δημιουργούμε το token που περιέχει το ID του χρήστη
      token = JsonWebToken.encode(user_id: user.id)
      render json: { token: token, message: "Login successful" }, status: :ok
    else
      render json: { error: "Invalid credentials" }, status: :unauthorized
    end
  end
    private
  
    def user_params
      params.permit(:name, :email, :password, :password_confirmation)
    end
  end