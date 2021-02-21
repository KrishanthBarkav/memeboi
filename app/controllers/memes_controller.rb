class MemesController < ApplicationController
    def show
        @current_user = session[:current_user_id]
        render "front-page"
    end
    def showd
        @current_user = session[:current_user_id]
        if(@current_user)
            render "dashboard"
        else
            redirect_to "/login"
        end
    end
    def create
        Meme.create!(url: params[:url], user_id: session[:current_user_id])
        redirect_to "/"
    end
end