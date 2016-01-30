class SkillsController < ApplicationController
  def new
  	@skill = Skill.new
  	@categories = Category.all
  end

  def create
    @skill = Skill.new(skill_params)
    if @skill.save 
      @collection = @skill.collections.create(teacher_id: user_id)
      if @collection.save
        redirect_to user_path(user_id)
      end
    else
      redirect_to new_user_skill_path(user_id)
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
