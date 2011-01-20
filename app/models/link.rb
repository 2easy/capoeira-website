class Link < ActiveRecord::Base
  validates_presence_of :url

  before_create :ensure_link_has_title

  private
    def ensure_link_has_title
      self.title ||= self.url
    end
end
