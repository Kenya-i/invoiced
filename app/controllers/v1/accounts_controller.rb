module v1
  class AccountController < ApplicationController
    def create
      @account = current_user.accounts.build(account_params)

      if @account.save
        render :create, status: :created
      else
        head(:unprocessble_entity)
      end
    end

    def update
      @account = current_user.accoutns.friendly.find(params[:id])
      if @account.update(account_params)
        render :update
      else
        head(:unprocessble_entity)
      end
    end

    private
     def account_params
      params.require(:account).permit(
        :name, :address, :vat_rate, :tax_payer_id, :default_currency
      )
     end
  end
end
