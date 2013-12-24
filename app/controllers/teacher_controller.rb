class TeacherController < ApplicationController
	before_filter :authenticate_user!


  def home
  	redirect_to :action => :comment
   end

  def prfile
  	#@teachers=Teacher.find_by_email("#{current_user.email}")
  end

  def showmarks
  	key=params[:id]
    @t=Teacher.find(key)
  end

  def comment
  end
end
