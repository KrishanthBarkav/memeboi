class MemesController < ApplicationController
    def show
        @current_user = session[:current_user_id]
        render "front-page"
    end
end