class AuthenticationController < ApplicationController
    # POST /signup
    def signup
      user = User.create!(user_params)
      render json: { message: "User created successfully" }, status: :created
    end
  
    # POST /auth/login
    def login
      user = User.find_by(email: params[:email])
      if user&.authenticate(params[:password])
        # Εδώ θα φτιάξουμε το Token αργότερα
        render json: { message: "Login successful", user_id: user.id }
      else
        render json: { error: "Invalid credentials" }, status: :unauthorized
      end
    end
  
    private
  
    def user_params
      params.permit(:name, :email, :password, :password_confirmation)
    end
  end