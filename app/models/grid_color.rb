class GridColor < ActiveRecord::Base
  belongs_to :user

  validates :box_no, presence: true, uniqueness: { scope: :user_id, message: "already taken" }
  validates :user_id, presence: true
  validates :color, presence: true
  scope :all_colors, -> { includes(:user).order('grid_colors.updated_at') }

  def as_json(options = {})
    base = super(only:[:box_no, :updated_at, :color], include: { user: {only: :user_name } })
    result = base.each_with_object({}) do |(k, v), object|
      if k == "updated_at"
        object["title"] = "#{base['user']['user_name']}(#{v.strftime('%D %H:%M')})"
      else
        object[k.camelize(:lower)] = v
      end
    end
    result
  end
end
