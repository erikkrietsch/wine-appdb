class Vote < ActiveRecord::Base
  belongs_to :wine_app
  belongs_to :user
  validates :quality_value, numericality: true
  validates :quality_value, inclusion: { in: (0..1), message: "quality vote must be between 0-1" }
  validates :difficulty_value, numericality: true 
  validates :difficulty_value, inclusion: { in: (0..1), message: "difficulty vote must be between 0-1" }
  
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
      params.require(:vote).permit(:quality_value, :difficulty_value)
    end

    def self.created_between(start_date, end_date)
      self.where("created_at >= ? AND created_at <= ?", start_date, end_date )
    end
end
