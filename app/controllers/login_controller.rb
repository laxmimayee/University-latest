class LoginController < ApplicationController
	before_filter :authenticate_user!

  def mainpage

    if current_user.role=="Student"
       #if(Student.find_by_email("#{current_user.email}")!= nil)
          redirect_to(:controller => 'student',:action => 'home')
        else current_user.role=="Teacher"
          redirect_to(:controller => 'teacher',:action => 'home')
        
    end

  end
  end