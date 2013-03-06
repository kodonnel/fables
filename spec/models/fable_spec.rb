require 'spec_helper'

describe Fable do

  let(:user) { FactoryGirl.create(:user) }
  before { @fable = user.fables.build(name: "Chapter 1", content: "Lorem ipsum") }

  subject { @fable }

  it { should respond_to(:name)}
  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should == user }

  it { should be_valid }

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Fable.new(user_id: user.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end    
  end

  describe "when user_id is not present" do
    before { @fable.user_id = nil }
    it { should_not be_valid }
  end

  describe "with blank content" do
    before { @fable.content = " " }
    it { should_not be_valid }
  end

  describe "with blank name" do
    before { @fable.name = " " }
    it { should_not be_valid }
  end

end
