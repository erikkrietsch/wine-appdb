class Vote < ActiveRecord::Base
  belongs_to :wine_app
  belongs_to :user
  validates :quality_value, numericality: { only_integer: true }
  validates :quality_value, inclusion: { in: (1..5), message: "quality vote must be between 1-5" }
  validates :difficulty_value, numericality: { only_integer: true }
  validates :difficulty_value, inclusion: { in: (1..5), message: "difficulty vote must be between 1-5" }
  scope :created_between, lambda {|start_date, end_date| where("created_at >= ? AND created_at <= ?", start_date, end_date )}
  def self.recent
    created_between(3.months.ago, Date.today)
  end
  def self.old
    created_between(6.months.ago, 3.months.ago)
  end
  def self.oldest
    created_between(1000.years.ago, 6.months.ago)
  end

  def create
    Vote.new(vote_params)
  end
  # get user's IP via request.remote_ip

  

  private 
    def vote_params
      require(:vote).permit(:quality_value, :difficulty_value, :vote_type)
    end
end
