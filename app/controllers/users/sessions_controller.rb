class Users::SessionsController < Devise::SessionsController

    def new
        @organization = Organization.all
        super
    end

    def create
        @organization = Organization.find_by(id: params[:organization_id])
        @user = @organization.users.find_by(email: params[:user][:email])
        if !@user
            flash[:notice] = "The user is not within the organization"
        elsif !@user.valid_password?(params[:user][:password])
              redirect_to new_user_session_path, notice: "Incorrect password !"
        else
            sign_in_and_redirect @user
        end
    end

    
end



# def create
#     user = User.find_by(email: params[:email])
#     if user && user.authenticate(params[:password])
#       session[:user_id] = user.id
#       respond_to do |format|
#         format.html { redirect_to root_path, notice: 'Logged in successfully.' }
#         format.json { render json: { message: 'Logged in successfully.' }, status: :ok }
#       end
#     else
#       respond_to do |format|
#         format.html do
#           flash.now[:alert] = 'Invalid email or password.'
#           render :new
#         end
#         format.json { render json: { error: 'Invalid email or password.' }, status: :unauthorized }
#       end
#     end
#   end
  