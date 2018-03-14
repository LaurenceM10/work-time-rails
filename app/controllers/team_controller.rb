class TeamController < ApplicationController
     def index
          @team = current_user.teams
     end

     def new

          @team = Team.new
     end

     def create
          @team = Team.new(team_params)

          respond_to do |format|
               if @team.save
                    format.html {redirect_to @team, notice: 'User team was successfully created.'}
                    format.json {render :show, status: :created, location: @team}
               else
                    format.html {render :new}
                    format.json {render json: @team.errors, status: :unprocessable_entity}
               end
          end
     end

     def show
          # To get the id of the current team
          @current_team = Team.find(params[:id])

          # To get all the events of the team
          @event = Event.where(:team_id => params[:id])


     end


     private
          # Use callbacks to share common setup or constraints between actions.
          def set_team
               @team = Team.find(params[:id])
          end

          # Never trust parameters from the scary inte rnet, only allow the white list through.
          def team_params
               params.require(:team).permit(:name, :objective, :description)
          end
end
