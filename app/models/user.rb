class User < ActiveRecord::Base
  def authenticated?
    true
  end
end
