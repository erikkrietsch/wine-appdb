class Vote < ActiveRecord::Base
  belongs_to :wine_app
  belongs_to :user
  validates :quality_value, numericality: true
  validates :quality_value, inclusion: { in: (0..100), message: "quality vote must be between 0-100" }
  validates :difficulty_value, numericality: true 
  validates :difficulty_value, inclusion: { in: (0..100), message: "difficulty vote must be between 0-100" }
  

  def self.recent
    self.where("#{user_exists(true)} AND #{created_between(3.months.ago, Time.now.utc)}").all
  end
  def self.old
    self.where("(#{user_exists(false)} AND #{created_between(3.months.ago, Time.now.utc)}) OR (#{created_between(6.months.ago, 3.months.ago)})").all
  end
  def self.oldest
    self.where("#{created_between(1000.years.ago, 6.months.ago)}").all
  end

  def create
    Vote.new(vote_params)
  end
  # get user's IP via request.remote_ip

  

  private 
    def vote_params
      params.require(:vote).permit(:quality_value, :difficulty_value)
    end

    def self.user_exists(exists = false)
      "user_id IS %s NULL" % [exists ? "NOT" : ""]
    end

    def self.created_between(start_date, end_date)
      "created_at >= '%s' AND created_at <= '%s'" % [start_date, end_date]
    end

    # unregistered votes automatically get taken down a peg
    # def self.created_between(start_date, end_date)
    #   self.where("(user_id IS NULL AND created_at >= ? AND created_at <= ?) OR (created_at >= ? AND created_at <= ?)", start_date, Date.today+1, start_date, end_date )
    # end

    def self.user_created_between(start_date, end_date)
      self.where("user_id IS NOT NULL AND created_at >= ? AND created_at <= ?", start_date, end_date )
    end
end