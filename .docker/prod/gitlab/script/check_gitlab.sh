#!/bin/bash

source /script/functions.sh

REQUIRED_VARS=("GITLAB_HOST")

check_env_vars
wait_for_gitlab
