module QuestsHelper

  def quest_footer_for_quest(quest)
    if params[:user_id]
      if quest.completed
        render 'quests/disabled_button', message: "Completed"
      else
        render 'quests/complete_button', object: quest, url: "/complete_quest" 
      end
    else
      if current_user.quests.include?(quest)
        render 'quests/disabled_button', message: "Accepted"
      else
        render 'quests/accept_quest_button', quest: quest
      end
    end
  end


  def calculate_points_for_quest(quest)
    diff_pts = quest.difficulty_level * 1.2
    level_scaling = quest.level_requirement
    pts = (diff_pts + level_scaling) * 40
    return pts.to_i
  end

end
