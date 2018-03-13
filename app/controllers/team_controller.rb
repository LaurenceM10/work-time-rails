class TeamController < ApplicationController
     def index
          # @team = Team.includes(:user_teams).where(:user_id => current_user.id)
          #@team = Team.includes(:user_teams).all
          @team = current_user.teams

          # @team = Team.select(Arel.star).joins(
          #     Team.arel_table.join(UserTeam.arel_table).on(
          #         UserTeam.arel_table[:user_id].eq(current_user.id)
          #     ).join_sources
          # ).order(:created_at).reverse_order
     end

     def new
          @team = Team.new
     end

     def create
          @team = Team.new(team_params)

          respond_to do |format|
               if @team.save
                    format.html {redirect_to new_user_team_path, notice: 'User team was successfully created.'}
                    format.json {render :show, status: :created, location: @team}
               else
                    format.html {render :new}
                    format.json {render json: @team.errors, status: :unprocessable_entity}
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
          params.require(:team).permit(:name, :objective, :description)
     end
end
