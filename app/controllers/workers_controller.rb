class WorkersController < ApplicationController

	def new
		@worker = Worker.new
	end

	def index
    @workers = Worker.paginate(page: params[:page])
  end

  def show
  	@worker = Worker.find(params[:id])
  end

	def create
		@worker = Worker.new(worker_params)

		if @worker.save
			redirect_to @worker
    	flash[:success] = "New worker successfully created!"
		else
			render 'new'
		end
	end

	def edit 
  end

  def update 
    if @worker.update_attributes(worker_params)
      flash[:success] = "Worker successfully changed"
      redirect_to @worker
    else
      render 'edit'
    end   
  end

  def destroy
    Worker.find(params[:id]).destroy
    flash[:success] = "Worker deleted"
    redirect_to workers_url
  end

  private 

	def worker_params
		params.require(:worker).permit(:name, :position, :avatar)
	end

end