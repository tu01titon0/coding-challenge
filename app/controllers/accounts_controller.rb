
class AccountsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_account, only: [:show, :update, :destroy, :edit]

  def index
    @accounts = current_user.accounts
  end

  def new
    @account = current_user.accounts.new
  end

  def create
    @account = current_user.accounts.new(account_params)

    respond_to do |format|
      if @account.save
        format.html { redirect_to @account, notice: 'account was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @account.destroy
    respond_to do |format|
      format.html { redirect_to accounts_url, notice: 'account was successfully destroyed.' }
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to @account, notice: 'account was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end


  def show
  end

  def account_params
    params.require(:account).permit(:name , :bank)
  end

  def set_account
    @account = Account.find(params[:id])
  end
end
