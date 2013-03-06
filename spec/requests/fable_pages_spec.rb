require 'spec_helper'

describe "Fable pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "fable creation" do
    before { visit root_path }

    describe "with invalid information" do

      it "should not create a fable" do
        expect { click_button "Post" }.not_to change(Fable, :count)
      end

      describe "error messages" do
        before { click_button "Post" }
        it { should have_content('error') } 
      end
    end

    describe "with valid information" do

      before { fill_in 'fable_content', with: "Lorem ipsum" }
      before { fill_in 'fable_name', with: "Chapter 1"}
      it "should create a fable" do
        expect { click_button "Post" }.to change(Fable, :count).by(1)
      end
    end
  end

  describe "fable destruction" do
    before { FactoryGirl.create(:fable, user: user) }

    describe "as correct user" do
      before { visit root_path }

      it "should delete a fable" do
        expect { click_link "delete" }.to change(Fable, :count).by(-1)
      end
    end
  end
end
