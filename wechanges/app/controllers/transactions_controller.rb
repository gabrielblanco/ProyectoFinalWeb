
class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]

  # GET /transactions
  # GET /transactions.json
  def index
    @transactions = Transaction.all
     if Session.find_by(token: params[:token])
        render json: @transactions, status: 200
    else
      render json: {:error => "not-found-authtoken"}.to_json, status: 422
    end
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
    respond_to do |format|
        if Session.find_by(token: params[:token])
          if @transaction = Transaction.find(params[:id])
            format.json {render json: @transaction, status: 200}  
          else
            format.json {render json:{:error => "not-found"}.to_json, status: 422}
          end
        else
        format.json {render json: {:error => "not-found-authtoken"}.to_json, status: 422}
        end
      end
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
  end

  # GET /transactions/1/edit
  def edit
    if Session.find_by(token: params[:token])
        @transaction = Transaction.edit(product_params)
        if @transaction.save 
          redirect_to '/index' 
        else 
          render 'new' 
        end
      end
  end

  # POST /transactions
  # POST /transactions.json
  def create
    @transaction = Transaction.new
      respond_to do |format|
      if Session.find_by(token: params[:token])
      
        @transaction.product_req_id = params[:product_req_id]
        @transaction.product_offert_id = params[:product_offert_id]
        @transaction.status = params[:status]
        if @transaction.save
         format.json { render json: @transaction, status: 201 }
        else
         format.json {render json: @transaction.errors, status: 422 }
        end
      else
       format.json {render json: {:error => "not-found-authtoken"}.to_json, status: 422}
      end
    end
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to @transaction, notice: 'Transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url, notice: 'Transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params.require(:transaction).permit(:product_req_id, :product_offert_id, :status)
    end

end
