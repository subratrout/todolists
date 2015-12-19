class TodoItem < ActiveRecord::Base
  belongs_to :todo_list
  belongs_to :user
  
  default_scope { order('due_date ASC')}
end
