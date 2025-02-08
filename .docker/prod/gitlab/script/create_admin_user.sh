#!/bin/bash

source /script/functions.sh

REQUIRED_VARS=("GITLAB_HOST" "GITLAB_USERNAME" "GITLAB_EMAIL" "GITLAB_NAME" "GITLAB_PASSWORD" "GITLAB_PROJECTS_LIMIT")

check_env_vars
wait_for_gitlab

if check_user_exists; then
  echo "Skipping user creation, user $GITLAB_EMAIL exists!"
else
  echo "Creating admin user..."
  gitlab-rails runner "
    u = User.new(username: ENV['GITLAB_USERNAME'], email: ENV['GITLAB_EMAIL'], name: ENV['GITLAB_NAME'], password: ENV['GITLAB_PASSWORD'], password_confirmation: ENV['GITLAB_PASSWORD'])
    u.assign_personal_namespace(Organizations::Organization.default_organization)
    u.skip_confirmation!
    u.admin = true
    u.projects_limit = ENV['GITLAB_PROJECTS_LIMIT'].to_i
    u.save!
  "
  echo "User $GITLAB_EMAIL created!"
fi
