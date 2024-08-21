class ProfilesController < ApplicationController
  # before_action :authenticate_user!

  def new
    @profile = Profile.new
  end
  
  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id
    if @profile.save
      redirect_to root_path
    else 
      render :new, alert: "failed to create profile."
    end
  end

  def show
    @profile = Profile.find(params[:id])
    end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    respond_to do |format|
      @profile = Profile.find(params[:id])
      @profile.update(profile_params)
      if @profile.save
        format.html { redirect_to profile_url(@profile), notice: "Profile was successfully updated." }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
  def profile_params
    params.require(:profile).permit(:full_name, :gender, :address, :contact_no, :bio, :image)
  end
end
