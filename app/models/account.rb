class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  enum role: [:user, :operator, :specialist , :admin] 
  belongs_to :user, optional: true
  belongs_to :operator, optional: true
  belongs_to :specialist, optional: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  before_save :find_reference

  def find_reference
    if self.role == "user"
      user = User.find_by(email: self.email)
      if user.present?
        self.user_id = user.id
      else
        self.destroy!
      end
      
    elsif self.role == "operator"
      operator = Operator.find_by(email: self.email)
      if operator.present?
        self.operator_id = operator.id
      else
        self.destroy!
      end  

    elsif self.role == "specialist"
      specialist = Specialist.find_by(email: self.email)
      if specialist.present? 
        self.specialist_id = specialist.id  
      else 
        self.destroy!
      end
    end 
  end
end
