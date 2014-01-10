class Vote < ActiveRecord::Base
  belongs_to :wine_app
  belongs_to :user
  validates :value, numericality: { only_integer: true }
  validates :value, inclusion: { in: (1..5), message: "vote must be between 1-5" }
  validates :vote_type, inclusion: { in: ["quality", "simplicity"], message: "invalid vote type" }
  def create
    Vote.new(vote_params)
  end
  # get user's IP via request.remote_ip


  private 
    def vote_params
      require(:vote).permit(:value, :vote_type)
    end

    def validate_vote_range(vote)
      #vote.errors.add("Vote must be between 1 and 5") unless (1..5).include? vote.value 
    end
end
