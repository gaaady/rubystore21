Spree::Order.class_eval do
  attr_accessor  :tafnit_id
  checkout_flow do
    go_to_state :cart
    go_to_state :address
    go_to_state :delivery
    go_to_state :payment, if: ->(order) {
      order.update_totals
      order.payment_required?
    }
    go_to_state :confirm, if: ->(order) { order.confirmation_required? }
    go_to_state :complete
    add_transition :from => :cart, :to => :address
    remove_transition :from => :delivery, :to => :confirm
  end
  state_machine do
    after_transition to: :complete do |order|
    end
  end
end
