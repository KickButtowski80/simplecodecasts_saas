class ProfilesController < ApplicationController
    def new
        # form where a user can fill out their own profile.
        @user = User.find( params[:user_id] )
=begin
          @user.build_profile is the same as
  
          Profile.new(:user_id => @user.id)
          while @user.create_profile is the same as
          
          Profile.create(:user_id => @user.id)
          @user.create_profile can be presented with build_profile like this:
          
          profile = @user.build_profile
          profile.save
=end
       
        @profile = Profile.new
    end
    
    
    def create 
    @user = User.find( params[:user_id] )
    @profile = @user.build_profile(profile_params)
    if @profile.save
      flash[:success] = "Profile Updated!"
      redirect_to user_path( params[:user_id] )
    else
      render action: :new
    end
    end
    
    def edit
      @user = User.find( params[:user_id] )
      @profile = @user.profile
    end

    
    
  
  private
    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :job_title, :phone_number, :contact_email, :description)
    end

end