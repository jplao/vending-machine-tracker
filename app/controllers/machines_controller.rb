class MachinesController < ApplicationController
  def index
    @owner = Owner.find(params[:owner_id])
  end

  def show
    @machine = Machine.find(params[:id])
    @snacks = Snack.where(machine_id = @machine.id)
    @average = @snacks.average_price
  end
end
