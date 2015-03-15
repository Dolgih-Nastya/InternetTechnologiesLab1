class Comment < ActiveRecord::Base
  acts_as_votable
  belongs_to :article
  belongs_to :user
end
