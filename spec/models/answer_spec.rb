require 'spec_helper'

describe Answer do
  let(:user) { FactoryGirl.create(:user) }
  before { @micropost = user.microposts.build(name: "Chapter 1", content: "Lorem ipsum") }
  before { @survey = @micropost.create_survey }
  before { @question = @survey.questions.build }
  before { @answer = @question.answers.build(content: "Lorem ipsum") }

  subject { @answer }

  it { should respond_to(:content) }

  it { should be_valid }

  describe "with blank content" do
    before { @answer.content = " " }
    it { should_not be_valid }
  end
end
