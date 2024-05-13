module PolyNotesHelper
    def poly_notes
        @poly_notes.where(notable_type: @notable_type, notable_id: @notable_id).each do |poly_note|
        end
    end

    def model(poly_note)
        if poly_note.user.present?
            "User"
        elsif poly_note.operator.present?
            "Operator"
        elsif poly_note.specialist.present?
            "Specialist"
        end
    end

    def model_name(poly_note)
        if poly_note.user.present?
            poly_note.user.name
        elsif poly_note.operator.present?
            poly_note.operator.name
        elsif poly_note.specialist.present?
            poly_note.specialist.name
        end
    end
end
