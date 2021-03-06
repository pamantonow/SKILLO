class SkillsController < ApplicationController
  
  before_action :authenticate_user!
  # before_action :authenticate_account
  def new
    p "*******************"
    p params[:user_id]
    p user_id
    if user_id != params[:user_id].to_i
      redirect_to user_path(current_user)
    end
    @skills = current_user.skills
  	@skill = Skill.new
  	@categories = Category.all
    
  end

  def create
    @skill = Skill.new(skill_params)
    if @skill.save 
      @collection = @skill.collections.create(teacher_id: user_id)
      if @collection.save
        redirect_to edit_collection_path(@collection)
      end
    else
      redirect_to new_user_skill_path(user_id)
    end
  end

  def index
    @skills = current_user.skills
    @all_skills = Skill.all
    if request.xhr?
      respond_to do |format|
        format.json { render json: @all_skills }
      end
    end
  end

  private
  def skill_params
    params.require(:skill).permit(:name, :user_id, :category_id)
  end

  def show
  	@skill = Skill.find(params[:id])
  end

  

end
