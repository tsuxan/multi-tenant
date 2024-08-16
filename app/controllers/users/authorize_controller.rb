class AuthorizeController < ApplicationController
    before_action :check_user_id
    before_action :check_organization_id

    
private
    def check_user_id
        user = Organization.find(params[:organization_id])
    end

    def check_organization_id
        if Organization.find(params[:organization_id]).user.include? current_user
            redirect_to blogs_path
        else
            flash[:alert] = "This user doesnot belong to current organization"
            redirect_to root_path
        end

    end
end