class User < ActiveRecord::Base

  include ActiveModel::ForbiddenAttributesProtection

  validates_presence_of :name, :email, message: "Deve ser preenchido"
  validates_numericality_of :phone
  validates_uniqueness_of :email

  belongs_to :gcem
end