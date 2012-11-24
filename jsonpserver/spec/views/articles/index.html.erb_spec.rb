require 'spec_helper'

describe "articles/index" do
  before(:each) do
    assign(:articles, [
      stub_model(Article,
        :name => "Name",
        :thumbnail => "Thumbnail",
        :link => "Link"
      ),
      stub_model(Article,
        :name => "Name",
        :thumbnail => "Thumbnail",
        :link => "Link"
      )
    ])
  end

  it "renders a list of articles" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Thumbnail".to_s, :count => 2
    assert_select "tr>td", :text => "Link".to_s, :count => 2
  end
end
