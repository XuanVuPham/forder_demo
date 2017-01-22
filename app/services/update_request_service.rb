class UpdateRequestService
  def initialize request, param
    @request = request
    @param = param
  end

  def update
    ActiveRecord::Base.transaction do
      if @request.update_attributes! @param
        ApproveRequestService.new(@request).add
        return I18n.t "request_shop.success"
      end
    end
  end
end
