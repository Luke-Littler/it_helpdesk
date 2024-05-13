module UsersHelper

    def user_unresolved_problems
        Problem.where(user_id: @user.id, status: :unresolved).count
    end

    def user_specialist_assigned_problems
        Problem.where(user_id: @user.id, status: :specialist_assigned).count
    end

    def user_resolved_problems
        Problem.where(user_id: @user.id, status: :resolved).count
    end
end
