module NippoCore
  class ReportsController < ApplicationController
    before_action :authenticate_user!
    before_action :find_group
    before_action :initialize_report, except: :index

    def index
      @reports = @group.reports
    end

    def show
    end

    def new
    end

    def create
      if @report.save
        redirect_to group_reports_path(group_id: @group.id)
      else
        render 'new', status: 400
      end
    end

  private
    def find_group
      @group = NippoCore::Group.find(params[:group_id])
    end

    def initialize_report
      # TODO: selectable reported_at
      @report = @group.reports.find_by(id: params[:id]) || @group.reports.new(report_params.merge(reported_at: Date.today, user: current_user))
    end

    def report_params
      params.fetch(:report, {}).permit(:body)
    end
  end
end
