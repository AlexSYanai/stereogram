class Snippet < ActiveRecord::Base
  belongs_to :track
  belongs_to :user

  has_many :votes, as: :votable

  validates :user, presence: true
  validates :start_time, :end_time, presence: true

  def original_creator
    self.track.user
  end
end
