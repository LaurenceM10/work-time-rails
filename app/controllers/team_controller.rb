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
                    #format.html {redirect_to @team, notice: 'User team was successfully created.'}
                    format.html {redirect_to new_user_team_path, notice: 'User team was successfully created.'}
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
     end

     def events
          # To get the id of the current team
          @current_team = Team.find(params[:id])
          @event = Event.where(:team_id => params[:id])
     end

     # To create a event
     def event
          @event = Event.new
          @event.title = params[:title].to_s
          @event.description = params[:description].to_s
          @event.date = Date.new
          @event.latitude = 15.2
          @event.longitude = 10.6
          @event.team_id = Team.find(params[:id]).id
          @event.user_id = current_user.id

          respond_to do |format|
               if @event.save
                    format.html {redirect_to events_team_path, notice: 'User team was successfully created.'}
                    format.json {render :show, status: :created, location: @event}
               else
                    format.html {redirect_to team_path}
                    format.json {render json: @team.errors, status: :unprocessable_entity}
               end
          end
     end

     def tasks
          # To get the id of the current team
          @current_team = Team.find(params[:id])
          @task = Task.where(:team_id => params[:id])
     end

     # To create a event
     def task
          @task = Task.new
          @task.title = params[:title].to_s
          @task.description = params[:description].to_s
          @task.date = Date.new
          @task.team_id = Team.find(params[:id]).id

          respond_to do |format|
               if @task.save
                    format.html {redirect_to tasks_team_path, notice: 'Task was successfully created.'}
                    format.json {render :show, status: :created, location: @task}
               else
                    format.html {redirect_to tasks_team_path}
                    format.json {render json: @task.errors, status: :unprocessable_entity}
               end
          end
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

          # Event form params
          def event_params
               params.require(:event).permit(:title, :description)
          end

          # Event form params
          def task_params
               params.require(:event).permit(:title, :description, :date)
          end
end
