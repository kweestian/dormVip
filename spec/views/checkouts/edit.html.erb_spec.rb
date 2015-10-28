require 'spec_helper'

describe "checkouts/edit" do
  before(:each) do
    @checkout = assign(:checkout, stub_model(Checkout,
      :order_id => nil,
      :user_id => nil,
      :paid => false
    ))
  end

  it "renders the edit checkout form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", checkout_path(@checkout), "post" do
      assert_select "input#checkout_order_id[name=?]", "checkout[order_id]"
      assert_select "input#checkout_user_id[name=?]", "checkout[user_id]"
      assert_select "input#checkout_paid[name=?]", "checkout[paid]"
    end
  end
end
