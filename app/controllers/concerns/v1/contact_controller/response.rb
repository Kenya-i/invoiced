module V1
  module Contacts
    module Response
      extend ActiveSupport::Concern

      def update_and_remder_contact(contact, params)
        contact.update(params) && render(:update, locals: { contact: contact})
      end

      def create_and_render_contact(contact)
        contact.save && render(:create, status: :created, locals: { contact: contact })
      end

      def render_invalid_response
        head(:unprocessble_entity)
      end
    end
  end
end
