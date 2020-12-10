module CategoriesHelper
  private
  def get_categories
    Category.all.collect
  end

  def set_joint_table_talent_category(model)
    @joint_table_talent_category = JoinTableTalentCategory.where(talent_id: model.id)
  end
end
