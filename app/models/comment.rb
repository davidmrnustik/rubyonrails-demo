class Comment < ActiveRecord::Base
  belongs_to :movie
  
  def self.descending #class method instead of normal method
    order(created_at: :desc)
  end
end
