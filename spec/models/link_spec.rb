require 'spec_helper'

describe Link do

  let(:user) { FactoryGirl.create(:user) }
  before { @link = user.links.build(url: "www.thisismyblog") }

  subject { @link }

  it { should respond_to(:url)}
  its(:linkable) { should == user }

  it { should be_valid }

  describe "accessible attributes" do
    it "should not allow access to ulinkable_id" do
      expect do
        Link.new(linkable_id: user.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end    
  end

  describe "when linkable_id is not present" do
    before { @link.linkable_id = nil }
    it { should_not be_valid }
  end

  describe "with blank address" do
    before { @link.url = " " }
    it { should_not be_valid }
  end

end