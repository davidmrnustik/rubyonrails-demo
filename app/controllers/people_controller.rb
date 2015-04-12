class PeopleController < ApplicationController
  def index
  	@people = People.all
  end
end
