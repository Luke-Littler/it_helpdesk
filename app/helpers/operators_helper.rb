module OperatorsHelper
    def operator_unresolved_problems
        Problem.where(operator_id: @operator.id, status: :unresolved).count
    end

    def operator_specialist_assigned_problems
        Problem.where(operator_id: @operator.id, status: :specialist_assigned).count
    end

    def operator_resolved_problems
        Problem.where(operator_id: @operator.id, status: :resolved).count
    end
end
