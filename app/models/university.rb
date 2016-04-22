class University < ActiveRecord::Base
  belongs_to :users

  # DBの制約を、アプリケーション側でも、Modelの中でvalidatesとして行ってください。
end
