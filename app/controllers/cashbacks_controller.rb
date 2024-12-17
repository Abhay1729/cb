class CashbacksController < ApplicationController
  before_action :set_cashback, only: %i[ show update mark_expired]
  skip_before_action :verify_authenticity_token

  def mark_expired
    if @cashback.status == 'unredeemed'
      @cashback.update(status: 'expired')
      @cashback.user.update(cb_redeemable: @cashback.user.cb_redeemable - @cashback.amount)
      message = "Cashback with id #{@cashback.id} expired. User cashback: #{@cashback.user.cb_redeemable}"
    else
      message = "Cashback already redeemed/expired"
    end
    redirect_to orders_with_cashback_restaurant_path(@cashback.order.restaurant), alert: message
  end
  # GET /cashbacks or /cashbacks.json
  def index
    @cashbacks = Cashback.all
  end

  # GET /cashbacks/1 or /cashbacks/1.json
  def show
  end

  # GET /cashbacks/new
  def new
    @cashback = Cashback.new
  end

  # GET /cashbacks/1/edit
  def edit
  end

  # POST /cashbacks or /cashbacks.json
  def create
    @cashback = Cashback.new(cashback_params)

    respond_to do |format|
      if @cashback.save
        format.html { redirect_to @cashback, notice: "Cashback was successfully created." }
        format.json { render :show, status: :created, location: @cashback }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cashback.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cashbacks/1 or /cashbacks/1.json
  def update
    respond_to do |format|
      if @cashback.update(cashback_params)
        format.html { redirect_to @cashback, notice: "Cashback was successfully updated." }
        format.json { render :show, status: :ok, location: @cashback }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cashback.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cashbacks/1 or /cashbacks/1.json
  def destroy
    @cashback.destroy

    respond_to do |format|
      format.html { redirect_to cashbacks_path, status: :see_other, notice: "Cashback was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cashback
      @cashback = Cashback.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cashback_params
      params.fetch(:cashback, {})
    end
end
