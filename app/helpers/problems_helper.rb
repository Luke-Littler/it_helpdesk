module ProblemsHelper

   

    def available_specialist
        if Specialist.where(specialist_type: @problem.problem_type, specialist_sub_type: @problem.problem_sub_type).present?
            specialist = Specialist.where(specialist_type: @problem.problem_type, specialist_sub_type: @problem.problem_sub_type).left_joins(:problems).group(:id).order('COUNT(problems.id) ASC').first
        else 
            specialist = Specialist.where(specialist_type: @problem.problem_type).left_joins(:problems).group(:id).order('COUNT(problems.id) ASC').first
        end
        return specialist
    end

    def first_problem_note
        @note = PolyNote.where(notable_type: "Problem", notable_id: @problem.id).first
        return @note.note
    end  

    def time_difference
        time_diff = TimeDifference.between(@problem.created_at, @problem.updated_at).humanize
        return time_diff
    end
end
