require 'spec_helper'

describe Tagging do
  let(:user) { FactoryGirl.create(:user) }
  let(:micropost) { user.microposts.create(name: "Chapter 1", content: "Lorem ipsum") }

  before { @tag = micropost.tags.create(name: "genre") }
  
  it { should respond_to(:micropost_id)}
  it { should respond_to(:tag_id)}

  it { should be_valid }

  it "should have created a tagging" do
    Tagging.first.tag_id.should == @tag.id
    Tagging.first.micropost.should == micropost
  end

end
