class AgentsController < ApplicationController
  before_action :authenticate_agent!
  before_action :set_agent, only: [:show, :edit, :update, :destroy]

  def index
  	if flash[:search].blank?
			@agents = Agent.where('id!=?', 1)
		else
			s_params = flash[:search]
			@agents = Agent.where('id!=?', 1)

			if !s_params["status"].blank?
	      @agents = @agents.where( :status=>s_params["status"] )
	      @status = s_params["status"]
	    end

	    if !s_params["state"].blank?
	      @agents = @agents.where( :state=>s_params["state"] )
	      @state = s_params["state"]
	    end

	    if !s_params["search"].blank?
	      @search = s_params["search"]
	      @agents = @agents.where("first_name LIKE ? OR last_name LIKE ? OR email LIKE ?", "%#{@search}%", "%#{@search}%", "%#{@search}%")
	    end
	  end
  end

  def cnew
		agent = Agent.new(agent_params)
		agent.status = "Active"
		
		begin
		  agent.save!(validate: false)
		rescue => ex
		  logger.error ex.message
		end

		redirect_to agents_path
  end

  def show
  	@agent = Agent.find_by_id(params[:id])
  end

  def activate_agent
  	@agent = Agent.find(params[:format])
  	@agent.activate?
  	redirect_to agent_path(@agent)
  end

  def search
    redirect_to agents_path, flash: { search: search_params }
  end

  def destroy
    @agent.destroy
    respond_to do |format|
      format.html { redirect_to agents_url, notice: 'Agent was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private 
  	def set_agent
      @agent = Agent.find(params[:id])
    end

	  def agent_params
	  	params.permit(:first_name, :last_name, :password, :password_confirmation, :avatar, :email)
	  end

	  def search_params
      params.permit(:status, :state, :search)
    end
end
