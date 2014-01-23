# Configure Spree Preferences
#
# Note: Initializing preferences available within the Admin will overwrite any changes that were made through the user interface when you restart.
#       If you would like users to be able to update a setting with the Admin it should NOT be set here.
#
# In order to initialize a setting do:
# config.setting_name = 'new value'
Spree.config do |config|
  # Example:
  # Uncomment to override the default site name.
  # config.site_name = "Spree Demo Site"
end
#Spree::PermittedAttributes.line_item_attributes << :my_custom_attribute

module Spree
  module Core
    module ControllerHelpers
      module StrongParameters
        def permitted_checkout_attributes
          permitted_attributes.checkout_attributes + [
            :bill_address_attributes => permitted_address_attributes,
            :ship_address_attributes => permitted_address_attributes,
            :payments_attributes => permitted_payment_attributes,
            :shipments_attributes => permitted_shipment_attributes,
            :line_items_attributes => permitted_line_item_attributes
          ]
        end
      end
    end
  end
end
