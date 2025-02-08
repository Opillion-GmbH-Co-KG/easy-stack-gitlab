#!/bin/bash

check_env_vars() {
  echo "Checking required environment variables..."
  for VAR in "${REQUIRED_VARS[@]}"; do
    if [ -z "${!VAR}" ]; then
      echo "Error: Environment variable $VAR is not set."
      exit 1
    fi
  done
  echo "All required environment variables are set."
}

wait_for_gitlab() {
  echo "Checking if GitLab is available at $GITLAB_HOST..."
  until curl -s "$GITLAB_HOST/users/sign_in" | grep -q "Sign in"; do
    echo "Waiting for GitLab to start..."
    sleep 5
  done
  echo "GitLab is available!"
}

check_user_exists() {
  echo "Checking if user $GITLAB_EMAIL already exists..."

  USER_EXISTS=$(gitlab-rails runner "
    if User.find_by(email: ENV['GITLAB_EMAIL'])
      puts 'true'
    else
      puts 'false'
    end
  " | tail -n1)

  if [ "$USER_EXISTS" == "true" ]; then
    echo "User $GITLAB_EMAIL already exists."
    return 0
  else
    echo "User $GITLAB_EMAIL does not exist."
    return 1
  fi
}
