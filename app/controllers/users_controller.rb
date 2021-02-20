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
        render plain: "hello"
    end
end