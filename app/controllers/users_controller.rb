class UsersController < ApplicationController
    def signup
        render "signup"
    end
    def create
        username = params[:username]
        password = params[:password]
        User.create!(username: username, password: password)
        redirect_to "/login"
    end
    def login
        render "login"
    end
    def validate
        user = User.find_by(username: params[:username]).try(:authenticate, params[:password])
        if(user)
            session[:current_user_id] = user.id
            render plain: user[:username]
        else
            render plain: "wrong"
        end
    end
end