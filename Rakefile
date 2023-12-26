# frozen_string_literal: true

# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

require 'active_record_doctor'

ActiveRecordDoctor::Rake::Task.new do |task|
  # Add project-specific Rake dependencies that should be run before running
  # active_record_doctor.
  task.deps = []

  # A path to your active_record_doctor configuration file.
  task.config_path = Rails.root.join('.active_record_doctor.rb')

  # A Proc called right before running detectors that should ensure your Active
  # Record models are preloaded and a database connection is ready.
  task.setup = -> { Rails.application.eager_load! }
end

Rails.application.load_tasks
