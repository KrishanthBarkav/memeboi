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
    def comment
        @meme_id = params[:id]
        @user_id = session[:current_user_id]
        if(@user_id)
            render "comments"
        else
            render plain: "login first"
        end
    end
    def comment_add
        @current_user = session[:current_user_id]
        if(@current_user)
            Comment.create!(comment: params[:comment], user_id: session[:current_user_id].to_i, meme_id: params[:id])
            redirect_to "/meme/"+params[:id].to_s
        else
            render plain: "login first"
        end
        
    end
end