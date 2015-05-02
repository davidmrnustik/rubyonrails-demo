class Comment < ActiveRecord::Base
  belongs_to :movie
  validates_presence_of :author, :rating
  
  def self.descending #class method instead of normal method
    order(created_at: :desc)
  end
end
