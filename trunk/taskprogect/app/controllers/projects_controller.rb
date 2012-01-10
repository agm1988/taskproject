class ProjectsController < ApplicationController
  
  layout :user_layout
  
  def index
    @projects = Project.find(:all)
    render :layout => "projects"
  end
  
  private
  
  def user_layout
    if false
      "admin"
    else
      "application"
    end
  end
  
end
