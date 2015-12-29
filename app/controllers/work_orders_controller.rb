class WorkOrdersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_work_order, only: [:show, :edit, :update, :destroy]

  def index
    @work_orders = WorkOrder.all
  end

  def search
    @search = params[:q]
    @work_orders = WorkOrder.search(@search)

    render :index
  end

  def new
    @work_order = WorkOrder.new
  end

  def show
  end

  def edit
  end

  def create
    @work_order = WorkOrder.new

    if @work_order.save
      redirect_to @work_order, flash: { success: "Work order was successfully created." }
    else
      render :new
    end
  end

  def update
    @work_order = WorkOrder.find(params[:id])

    if @work_order.update(work_order_params)
      redirect_to @work_order, flash: { success: "Work order successfully updated." }
    else
      flash.now[:error] = "Failed to update this Work order."
      render :edit
    end
  end

  def destroy
    @work_order.destroy

    redirect_to work_orders_url, flash: { notice: "Work order was successfully deleted." }
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_work_order
    @work_order = WorkOrder.find(params[:id])
  end

  # Whitelisted params.
  def work_order_params
    @work_order_params ||= params.require(:work_order).permit(:year, :make, :model, :style, :start_city, :start_state, :state_zip, :end_city, :end_state, :end_zip, :number_of_vehicles, :vehicle_image, :preferred_method_of_contact)
  end
end
