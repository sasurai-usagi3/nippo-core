module NippoCore
  class ReportsController < ApplicationController
    include Pundit
    before_action :authenticate_user!
    before_action :find_group
    before_action :initialize_report, except: :index

    # TODO: Implement test
    def index
      redirect_to home_path unless @group.member?(current_user)
      @reports = @group.reports
    end

    def show
      authorize @report
    end

    def new
      authorize @report
    end

    def create
      authorize @report
      if @report.save
        redirect_to group_reports_path(group_id: @group.id)
      else
        render 'new', status: 400
      end
    end

  private
    def initialize_report
      # TODO: selectable reported_at
      @report = @group.reports.find_by(id: params[:id]) || @group.reports.new(report_params.merge(reported_at: Date.today, user: current_user))
    end

    def report_params
      params.fetch(:report, {}).permit(:body)
    end
  end
end
