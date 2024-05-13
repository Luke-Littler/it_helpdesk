module EquipmentHelper
    def equipment_unresolved_problems
        Problem.where(equipment_id: @equipment.id, status: :unresolved).count
    end

    def equipment_specialist_assigned_problems
        Problem.where(equipment_id: @equipment.id, status: :specialist_assigned).count
    end

    def equipment_resolved_problems
        Problem.where(equipment_id: @equipment.id, status: :resolved).count
    end
end
