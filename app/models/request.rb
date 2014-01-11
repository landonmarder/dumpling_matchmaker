class Request < ActiveRecord::Base
  belongs_to :user,
    inverse_of: :requests

  validates_presence_of :soup
  validates_presence_of :user
end
