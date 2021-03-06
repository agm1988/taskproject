class Task < ActiveRecord::Base
  
  belongs_to :project, :counter_cache => true

  validates :name, :length => { :minimum => 3 }
  
#   def validate
#     errors.add(:mane, "Name is invalid")
#   end
  
  def self.find_incomplete(options={})
    with_scope :find => options do
      find_all_by_complete(false, :order => "name DESC")
    end
  end
  
#     def self.find_incomplete(options={})
#     
#       find_all_by_complete(false, options.merge(:order => "name DESC"))
#     
#   end
  
end
