class TodosController < ApplicationController
  def index
  	@todos = session[:todos] ||= []
  end

   def create
    session[:todos] << params[:task]
    redirect_to todos_path
  	end

  	def destroy
  		session[:todos] = []
  		redirect_to todos_path
  	end

  	def destroy_one
  		if session[:todos].include? params[:task]
  			session[:todos].delete(params[:task])
  		end
  		redirect_to todos_path
  	end
end
