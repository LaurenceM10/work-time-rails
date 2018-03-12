class TeamController < ApplicationController
     def index
          @team = Team.all
     end

     def new
          @team = Team.new
     end

     def create
          @team = Team.new(team_params)

          respond_to do |format|
               if @team.save
                    format.html { redirect_to @team, notice: 'User team was successfully created.' }
                    format.json { render :show, status: :created, location: @team }
               else
                    format.html { render :new }
                    format.json { render json: @team.errors, status: :unprocessable_entity }
               end
          end
     end



     private
     # Use callbacks to share common setup or constraints between actions.
     def set_team
          @team = Team.find(params[:id])
     end

     # Never trust parameters from the scary internet, only allow the white list through.
     def team_params
          params.require(:team).permit(:name, :description)
     end
end
