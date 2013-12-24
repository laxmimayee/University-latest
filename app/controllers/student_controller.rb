class StudentController < ApplicationController
	before_filter :authenticate_user!
  def home
  end

  def prfile
  end

  def showmarks
  end

  def comment
  end
end
