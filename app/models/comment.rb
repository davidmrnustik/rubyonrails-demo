class Comment < ActiveRecord::Base
  belongs_to :movie
  validates_presence_of :author, :rating
  validates_numericality_of :rating
  validates_length_of :rating, maximum: 2
  
  def self.descending #class method instead of normal method
    order(created_at: :desc)
  end
end
