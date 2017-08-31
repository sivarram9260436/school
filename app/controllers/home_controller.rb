require 'csv'
class HomeController < ApplicationController

  def index
  	@students=Division.find_by_id(session[:division_id]).students
  	@students=@students.paginate(:page => params[:page], :per_page => 5)
  end
      def csv
      csv_string = ''
      begin
        students=Division.find_by_id(session[:division_id]).students
        csv_string = CSV.generate do |csv|
        csv << ["First Name", "Last Name", "Date Of Birth", "Gender"]
        students.each do |x|
        csv << [x.first_name, x.last_name, x.dob, x.gender]
        end
        end 
      rescue
        csv_string = "NO DATA TO SEND"
      end
        send_data csv_string, :type => 'text/csv; charset=utf-8; header=present', :filename => "students.csv"
    end
end
