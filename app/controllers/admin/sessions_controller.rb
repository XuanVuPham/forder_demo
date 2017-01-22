class Admin::SessionsController < Devise::SessionsController
  layout "admin_lte_2_login", only: :new

  def new
    super
  end

  protected
  def after_sign_up_path_for resource
    signed_in_root_path resource
  end

  def after_update_path_for resource
    signed_in_root_path resource
  end
end

