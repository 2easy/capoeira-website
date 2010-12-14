class News < ActiveRecord::Base
  def block!
    false
  end
end
