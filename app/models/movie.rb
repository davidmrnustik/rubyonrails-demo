class Movie < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	validates_presence_of :name, :director
	validates_numericality_of :year, :length, greater_than: 0
	validates_uniqueness_of :name, message: "is alreasy used"
  # validates_length_of :format, maximum: 7, minimum: 2
	validates_length_of :year, is: 4
	paginates_per 5
	
	after_save :send_movies # make an action after save a movie
	
	def send_movies
	  logger.info "Going to send movies: #{name}"
	    #User.all.where(newsletter: true).each do |user|
	    #  UserMailer.newsletter(id, user).deliver
      #end
  end
	
	def proper_name
		name.titleize
	end
end
