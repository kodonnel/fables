require 'spec_helper'

describe Survey do
  let(:user) { FactoryGirl.create(:user) }
  let(:micropost) { user.microposts.build(name: "Chapter 1", content: "Lorem ipsum") }
  before { @survey = micropost.create_survey(name: "Fake Name", micropost: micropost) }

  subject { @survey }

  it { should respond_to(:name)}
  it { should respond_to(:questions) }
  it { should respond_to(:micropost_id) }
  it { should respond_to(:micropost) }

  its(:name) { should == "Fake Name"}
  its(:micropost) { should == micropost }

  it { should be_valid }

  describe "accessible attributes" do
    it "should not allow access to micropost_id" do
      expect do
        Survey.new(micropost_id: micropost.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end    
  end

  describe "when micropost_id is not present" do
    before { @survey.micropost_id = nil }
    it { should_not be_valid }
  end

  describe "with blank name" do
    before { @survey.name = " " }
    it { should_not be_valid }
  end
end
