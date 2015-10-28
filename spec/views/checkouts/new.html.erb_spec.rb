require 'spec_helper'

describe "checkouts/new" do
  before(:each) do
    assign(:checkout, stub_model(Checkout,
      :order_id => nil,
      :user_id => nil,
      :paid => false
    ).as_new_record)
  end

  it "renders new checkout form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", checkouts_path, "post" do
      assert_select "input#checkout_order_id[name=?]", "checkout[order_id]"
      assert_select "input#checkout_user_id[name=?]", "checkout[user_id]"
      assert_select "input#checkout_paid[name=?]", "checkout[paid]"
    end
  end
end
