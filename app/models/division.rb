class Division < ActiveRecord::Base
	has_many :staffs
	has_many :students
end
