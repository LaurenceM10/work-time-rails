class UserTeamsController < ApplicationController
     def index
          @user_team = UserTeam.all
     end

     def new
          # To instance a new UserTeam
          @user_team = UserTeam.new

          @users = if params[:username]
                        User.where('name LIKE ?', "%#{params[:username]}%")
                   else
                        User.all
                   end

          @team_id = params[:id]
     end

     def create
          @user_team = UserTeam.new
          @user_team.user_id = params[:user_id_list]
          @user_team.team_id = params[:team_id]

          respond_to do |format|
               if @user_team.save
                    format.html {redirect_to team_path(:id => params[:team_id]), notice: 'User team was successfully created.'}
                    format.json {render :show, status: :created, location: @user_team}
               else
                    format.html {render :new}
                    format.json {render json: @user_team.errors, status: :unprocessable_entity}
               end
          end
     end

     private
          # Use callbacks to share common setup or constraints between actions.
          def set_team
               @user_team = UserTeam.find(params[:id])
          end

          # Never trust parameters from the scary internet, only allow the white list through.
          def team_params
               params.require(:user_team).permit(:team_id, :user_id => [])
          end

          def user_params
               params.require(:user).permit(:username)
          end
end
