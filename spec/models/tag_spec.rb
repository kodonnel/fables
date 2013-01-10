require 'spec_helper'

describe Tag do
  let(:user) { FactoryGirl.create(:user) }
  let(:micropost) { user.microposts.build(name: "Chapter 1", content: "Lorem ipsum") }

	before { @tag = micropost.tags.build(name: "genre") }
	
  subject { @tag }

  it { should respond_to(:name)}

  it { should be_valid }

end
