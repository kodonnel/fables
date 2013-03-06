require 'spec_helper'

describe Tagging do
  let(:user) { FactoryGirl.create(:user) }
  let(:fable) { user.fables.create(name: "Chapter 1", content: "Lorem ipsum") }

  before { @tag = fable.tags.create(name: "genre") }
  
  it { should respond_to(:fable_id)}
  it { should respond_to(:tag_id)}

  it { should be_valid }

  it "should have created a tagging" do
    Tagging.first.tag_id.should == @tag.id
    Tagging.first.fable.should == fable
  end

end
