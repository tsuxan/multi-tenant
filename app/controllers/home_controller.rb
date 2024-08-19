class HomeController < ApplicationController
  def index
    if user_signed_in?
      @profile = Profile.find_by(user_id: current_user.id)
      if @profile.nil?
      redirect_to new_profile_path
      end
    end
  end
 
end
