require 'spec_helper'

describe "checkouts/index" do
  before(:each) do
    assign(:checkouts, [
      stub_model(Checkout,
        :order_id => nil,
        :user_id => nil,
        :paid => false
      ),
      stub_model(Checkout,
        :order_id => nil,
        :user_id => nil,
        :paid => false
      )
    ])
  end

  it "renders a list of checkouts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
