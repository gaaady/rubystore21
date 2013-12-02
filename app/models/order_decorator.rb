Spree::Order.class_eval do
  #attr_accessor  :tafnit_id
  insert_checkout_step :cart, :before => :address

  state_machine do
    after_transition to: :complete do |order|
    end
  end
end
