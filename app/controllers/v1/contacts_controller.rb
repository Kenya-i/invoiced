module v1
  class ContactsController < ApplicationController
    include V1::Contacts::Response
    def index
      @contacts = current_account.contacts
      render json: @contacts, status: :ok
    end

    def create
      contact = current_organization.contacts.build(contact_params)

      create_and_render_contact(contact) || render_invalid_response
      # if @contact.save
      #   render :create, status: :created
      # else
      #   head(:unprocessble_entity)
      # end
    end

    def update
      @contact = current_organization.contacts.build(params[:id])

      update_and_render_contact(contact, contact_params) || render_invalid_response
      # if @contact.update(contact_params)
      #   render :update
      # else
      #   head(:unprocessble_entity)
      # end
    end

    def destroy
      @contact = current_organization.contacts.build(params[:id])
      if @contact.destroy
        head(:ok)
      else
        head(:unprocessble_entity)
      end
    end
    
    def current_account
      @account ||= Account.friendly.find(params[:account_id])
      @account
    end

    private
      def contact_params
        params.require(:contact).permit(:email, :first_name, :last_name)
      end
  end
end
