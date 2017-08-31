class Student < ActiveRecord::Base
  belongs_to :division
  has_many :attendances, :as => :entity

  def full_name
  	full_name=self.first_name.to_s.capitalize + " " + self.last_name.to_s.capitalize
  	full_name
  end
end
