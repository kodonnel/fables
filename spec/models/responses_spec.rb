require 'spec_helper'

describe Responses do

  let(:viewer) { FactoryGirl.create(:user) }
  let(:creater) {FactoryGirl.create(:user)}
  let(:micropost) { creater.microposts.build(name: "Chapter 1", content: "Lorem ipsum") }
  let(:mysurvey) { micropost.survey.build(:name => "survey one") }
  let(:questionone) { mysurvey.questions.build(:content => "This is question one.") }
  let(:ansone) {questionone.answers.build(:content => "This is answer one.") }
  let(:anstwo) {questionone.answers.build(:content => "This is answer two.") }
  let(:response) { mysurvey.response.build(user_id: viewer.id, survey_id: mysurvey.id, question_id: questionone.id, answer_id: anstwo.id ) }

  subject { response }

  it { should be_valid }

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Response.new(user_id: viewer.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end    
  end

  describe "when user id is not present" do
    before { response.user_id = nil }
    it { should_not be_valid }
  end

  describe "when survey id is not present" do
    before { response.survey_id = nil }
    it { should_not be_valid }
  end

  describe "when question id is not present" do
    before { response.question_id = nil }
    it { should_not be_valid }
  end

  describe "when answer id is not present" do
    before { response.answer_id = nil }
    it { should_not be_valid }
  end
end