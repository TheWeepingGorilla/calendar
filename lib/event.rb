class Event < ActiveRecord::Base
  validates :description, :presence => true, :length => { :maximum => 50 }
  validates :location, :presence => true, :length => { :maximum => 50 }

  private


end
