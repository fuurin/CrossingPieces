class TopController < ApplicationController
  def index
  	@universities = University.all
	 	@people = User.all
  end
end
