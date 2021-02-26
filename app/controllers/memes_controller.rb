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
    def update
        @current_user = session[:current_user_id]
        if(@current_user)
            id = params[:id]
            meme = Meme.find(id)
            flag = 0
            dl = Like.first
            meme.likes.each do |like|
                if(like["user_id"].to_i == session[:current_user_id])
                    flag = 1
                    dl = like
                end
            end
            if(flag == 0)
                Like.create!(user_id: session[:current_user_id], meme_id: id)
            else
                dl.destroy
            end
            redirect_to "/"
        else
            render plain: "login first"
        end
        
    end
end