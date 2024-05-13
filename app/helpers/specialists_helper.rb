module SpecialistsHelper
    def specialist_unresolved_problems
        Problem.where(specialist_id: @specialist.id, status: :unresolved).count
    end

    def specialist_assigned_problems
        Problem.where(specialist_id: @specialist.id, status: :specialist_assigned).count
    end

    def specialist_resolved_problems
        Problem.where(specialist_id: @specialist.id, status: :resolved).count
    end
end
