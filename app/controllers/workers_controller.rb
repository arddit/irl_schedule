class WorkersController < ApplicationController

	def new
		@worker = Worker.new
	end

	def create
		worker_params = params.require(:worker).permit(:name, :position)
		@worker = Worker.new(worker_params)

		if @worker.save
			redirect_to workers_path
		else
			render 'new'
		end
	end
end