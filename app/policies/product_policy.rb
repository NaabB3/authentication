class ProductPolicy < ApplicationPolicy

  attr_reader :admin

  def initialize(admin,  record)
    @admin = admin
    @record = record
  end

  def create_product?
  	#1 means can add product
    admin.super_admin? || admin.role.permission_ids.include?(1)
  end

  def update_product?
  	#2 means can update product
    admin.super_admin? || admin.role.permission_ids.include?(2)
  end

  def delete_product?
  	#3 means can delete product
    admin.super_admin? || admin.role.permission_ids.include?(3)
  end

  def view_product?
  	#4 means can view product
    admin.super_admin? || admin.role.permission_ids.include?(4)
  end

end
