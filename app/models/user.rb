class User < ActiveRecord::Base

  include ActiveModel::ForbiddenAttributesProtection

  validates_presence_of :name, :email, message: "Deve ser preenchido"
  validates_numericality_of :phone
  validates_uniqueness_of :email

  has_and_belongs_to_many :roles
  has_and_belongs_to_many :gcems
end
