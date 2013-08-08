class TicketsController < ApplicationController
	before_action :find_project
	before_action :find_ticket, only: [:show, :create, :update, :destroy]
	def new
		@ticket = @project.tickets.build
	end
	def create
		respond_to do |format|
			
			@ticket = @project.tickets.build(ticket_params)
			# @ticket = @project.tickets.new(ticket_params)
			# @project.tickets << @ticket
			if @project.save
				format.html { redirect_to [@project, @ticket], notice: "ticket created successfully"}
			else
				format.html { render :new, alert: 'ticket could not be saved.'}
			end
		end
	end
	def show
	end



	private #---------------------------
	def find_project
		@project = Project.find(params[:project_id])
	end
	def find_ticket
		@ticket = Ticket.find(params[:id]) if params[:id]
	end
	def ticket_params
		params.require(:ticket).permit(:title, :description)
	end
end
