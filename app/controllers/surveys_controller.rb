class SurveysController < ApplicationController

  before_filter :signed_in_user

  def index
    @surveys = Survey.all
  end
  
  def show
    @survey = Survey.find(params[:id])
  end
  
  def create
    @survey = Survey.find(params[:survey])
    #@micropost = Micropost.find(params[:micropost])
   
    @survey.save!
    if @survey.save
      flash[:notice] = "Successfully created survey."
      redirect_to @survey
    else
      render :action => 'new'
      flash[:success] = "Survey not saved!"
    end
  end

  def new
    @micropost = Micropost.find(params[:micropost])
    @survey = @micropost.create_survey
    @survey.name = "Title"
    3.times do
      question = @survey.questions.build
      question.content = "Sample question content"
      4.times do
        answer = question.answers.build
        answer.content = "Sample answer content"
      end
    end
    @survey.save!
  end
  
  def edit
    @survey = Survey.find(params[:id])
  end
  
  def update
    @survey = Survey.find(params[:id])
    if @survey.update_attributes(params[:survey])
      flash[:notice] = "Successfully updated survey."
      redirect_to @survey
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @survey = Survey.find(params[:id])
    @survey.destroy
    flash[:notice] = "Successfully destroyed survey."
    redirect_to surveys_url
  end
end