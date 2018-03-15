class EventsController < ApplicationController


     def new
          @event = Even.new
     end

     def create
          @event = Event.new(event_params)
          @event.date = Date.new
          @event.latitude = 15.2
          @event.longitude = 25.3
          @event.team_id = 19
          @event.user_id = 4

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

     private
     # Event form params
     def event_params
          params.require(:event).permit(:title, :description)
     end
end
