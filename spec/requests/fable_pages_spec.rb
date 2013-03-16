require 'spec_helper'

describe "Fable pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  let(:fable) { FactoryGirl.create(:fable)}


  before { sign_in user }

  describe "show" do

    let!(:user) { FactoryGirl.create(:user) }
   
    describe "with creator" do
      before(:each) do
        sign_in fable.user
        visit fable_path(fable)
      end
      it { should have_selector('h3',    text: fable.name) }
      it { should have_link('edit') }
    end

    describe "with non-creator" do
      before(:each) do
        sign_in user
        visit fable_path(fable)
      end
      it { should have_selector('h3',    text: fable.name) }
      it { should_not have_link('Edit') }
    end

  end

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
