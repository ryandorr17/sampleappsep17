class TeamsController < ApplicationController

before_action :logged_in_user, only: [:create, :destory]
before_action :admin_user, only: [:destroy]




def create

  @team = Team.new(team_params)

  if @team.save

    flash[:success] = "Team created! Now go join it"

    redirect_to users_path

  else

   render 'users_path'

  end

end



def destroy

  Team.find(params[:id]).destroy

  flash[:success] = "Team deleted"

  redirect_to users_path

end


private



  def team_params

    params.require(:team).permit(:team_name, :tagline, :picture)

  end






end
