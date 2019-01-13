class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  ##devise :database_authenticatable, 
  ##       :recoverable, :rememberable, :validatable
  ##belongs_to :role
  belongs_to :category, optional: true
  belongs_to :empresa, optional: true
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable

  belongs_to :role

  def admin?
    return false if role.nil?
    role.code == Role::ADMIN
  end

  def guest?
    return true if role.nil?
    role.code  == Role::GUEST
  end

  def empresa?
    return false if role.nil?
    role.code  == Role::EMPRESA
  end

  def my_students
    case role.code
    when Role::ADMIN 
      return Student.all
    when Role::EMPRESA
      #empresa_id = 1
      empresa = Empresa.find(empresa_id)
      return empresa.students
    else
      return Student.where(id: 0)
    end
  end

=begin
  def admin?
    return false if role.nil?
    
    role.code == Role::ADMIN
  end
  def guest?
    return true if role.nil?
    role.code == Role::GUEST
  end
=end
end
