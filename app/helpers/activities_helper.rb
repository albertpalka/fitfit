module ActivitiesHelper
  def distance_this_week
    Activity.where(created_at: Date.today.beginning_of_week..Date.today.end_of_week)
            .pluck(:distance)
            .sum
            .round(2)
  end

  def all_activities
    arr = []

    (Date.today.beginning_of_month..Date.today.end_of_month).to_a.each do |date|
      activity = Activity.where(created_at: date.all_day)
      if activity.empty?
        next
      else
        distance = activity.pluck(:distance).sum
        arr << [date.strftime('%e. %B'), distance.round(2)]
      end
    end

    arr.reject { |d| d[1] == 0.0 }
  end
end
