module Api
  class TransactionsController < ApplicationController
    def index
      user = User.find_by(id: params[:user_id])
      if user
        @transactions = user.transactions
        render json: @transactions, status: :ok
      else
        render json: {}, status: :not_found
      end
    end
  end
end


# Status Code Symbol
# 2xx Success
# 200 :ok
# 201 :created

# 3xx Redirection
# 302 :found

# 4xx Client Error
# 400 :bad_request
# 401 :unauthorized
# 403 :forbidden
# 404 :not_found

# 5xx Server Error
# 500 :internal_server_error
