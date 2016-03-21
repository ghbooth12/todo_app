require 'rufus-scheduler'
require 'rake'
TodoApp::Application.load_tasks

load File.join(Rails.root, 'lib', 'tasks', 'todo.rake')
scheduler = Rufus::Scheduler.new

# scheduler.every '1m' do  # run every minutes
# scheduler.cron '0 0 * * * America/Chicago' do  # cron works only local
scheduler.every '1d' do   # run everyday
  Rake::Task["todo:delete_items"].reenable
  Rake::Task["todo:delete_items"].invoke
end
