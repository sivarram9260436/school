class StudentsController < ApplicationController


  def index
  end
    def create
      @student=Student.new(params_student)
      @student.division_id=session[:division_id] if session[:division_id]
      @student.save
      redirect_to student_path(@student)
    end

    def show
      @student=Student.find_by_id(params[:id])
      redirect_to root_path unless @student
    end

    def new
      @student=Student.new
    end

    def edit
      @student=Student.find_by_id(params[:id])
      redirect_to root_path unless @student
    end

    def update
          @student = Student.find_by_id(params[:id])
      if @user.update(params_student)
        redirect_to root_path, notice: 'Student was successfully updated.' 
      end       
    end
    
    def mark_attendance
      for_date = params[:date].keys.join("-").to_date rescue Date.today
      status = params[:mark_as].eql?("present") rescue false
      if params[:student_ids].present? 
        params[:student_ids].each do |x|
          begin
            Attendance.create(:entity_id=>x.to_i,:entity_type=>"Student",:status=>status,:for=> for_date)  
          rescue
            nil
          end
        end
      end
      redirect_to root_path, notice: 'Attendance marked for selected students.'
    end
    

    def fetch_attendance
      student=Student.find_by_id(params[:id])
      present_for=student.attendances.collect(&:status).group_by{|e| e}.map{|k, v| [k, v.length]}.to_h[true] rescue 0
      total_days=student.attendances.count rescue 0
      data="Present for #{present_for} days out of #{total_days}"+"_"+params[:id]
      respond_to do |format|
        format.js { render :inline => data }
      end
    end

    private

     def params_student
       params.require(:student).permit(:first_name,:last_name,:dob,:division_id,:gender,:parent_guardian_name)
     end


end
