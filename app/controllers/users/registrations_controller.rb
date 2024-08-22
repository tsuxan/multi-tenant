class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_permitted_parameters, if: :devise_controller?

  def new 
    @organization = Organization.all
    @user = User.new
  end

  def create
    @user = User.create(sign_up_params)
    if @user.save
      if organization.present?
        @user.membership.create(organization_id: @organization.id)
        flash[:notice] = "Your account has been created.Log In to continue"
        redirect_to root_path
      else
        flash[:notice] = "Registration failed.Try with another email or organization"
        render :new
      end
    else
      flash[:alert] =  "Registration fail"
      render :new

    end
  end

  private
     
    def sign_up_params
      params.require(:user).permit( :email, :password, :password_confirmation ,:organization_id )
      # params.require(:user).permit(:email, :password, :password_confirmation).merge(params[organization_id])
      end 

    def organization
         @organization = Organization.find(params[:organization_id])
    end
    
  # def new
  #   @organizations = Organization.all
  #   super
  # end

  # def create

  # end
end

