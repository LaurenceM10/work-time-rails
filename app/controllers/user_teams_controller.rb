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
     end

     def create
          @user_team = UserTeam.new(team_params)

          respond_to do |format|
               if @user_team.save
                    format.html {redirect_to new_team_url, notice: 'User team was successfully created.'}
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
               params.require(:user_team).permit(:user_id, :team_id)
          end

          def user_params
               params.require(:user).permit(:username)
          end
end
