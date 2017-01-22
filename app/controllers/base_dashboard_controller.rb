class BaseDashboardController < ApplicationController
  before_action :authenticate_user!
end
