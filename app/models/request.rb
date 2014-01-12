class Request < ActiveRecord::Base
  belongs_to :user,
    inverse_of: :requests

  validates_presence_of :soup
  validates_presence_of :user

  def self.results
    Request.where("created_at > ?", 1.days.ago)
  end
end
