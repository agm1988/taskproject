class AddTasksCount < ActiveRecord::Migration
def self.up
  add_column :projects, :tasks_count, :integer, :default => 0

  Project.reset_column_information
  Project.find(:all).each do |p|
    Project.update_counters p.id, :tasks_count => p.tasks.length
  end
end

def self.down
  remove_column :projects, :tasks_count
end

end



 



