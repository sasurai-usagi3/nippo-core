module NippoCore
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
  private
    def find_group
      @group = NippoCore::Group.find(params[:group_id])
    end
  end
end
