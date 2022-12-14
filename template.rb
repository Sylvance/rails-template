# create root files
file '.dockerignore', <<-CODE
vendor/bundle
CODE

file '.env.example', <<-CODE
# Redis configurations
REDIS_URL="redis://127.0.0.1:6379/0"

# Sample database Configuration
SAMPLE_APP_DATABASE_HOST=localhost
SAMPLE_APP_DATABASE_NAME=sample_development
SAMPLE_APP_DATABASE_USERNAME=''
SAMPLE_APP_DATABASE_PASSWORD=''
SAMPLE_APP_DATABASE_SECRET=''

CODE

file '.env.test.example', <<-CODE
# Redis configurations
REDIS_URL="redis://127.0.0.1:6379/0"

# Sample database Configuration
SAMPLE_APP_DATABASE_HOST=localhost
SAMPLE_APP_DATABASE_NAME=sample_development
SAMPLE_APP_DATABASE_USERNAME=''
SAMPLE_APP_DATABASE_PASSWORD=''
SAMPLE_APP_DATABASE_SECRET=''

CODE

file '.gitattributes', <<-CODE
# See https://git-scm.com/docs/gitattributes for more about git attribute files.

# Mark the database schema as having been generated.
db/schema.rb linguist-generated

# Mark any vendored files as having been vendored.
vendor/* linguist-vendored

CODE

file '.gitignore', <<-CODE
# See https://help.github.com/articles/ignoring-files for more about ignoring files.
#
# If you find yourself ignoring temporary files generated by your text editor
# or operating system, you probably want to add a global ignore instead:
#   git config --global core.excludesfile '~/.gitignore_global'

# Ignore bundler config.
/.bundle
.idea/

# Ignore all logfiles and tempfiles.
/log/*
/tmp/*
!/log/.keep
!/tmp/.keep
/public/system/*
/public/assets/*

# Ignore pidfiles, but keep the directory.
/tmp/pids/*
!/tmp/pids/
!/tmp/pids/.keep

# Ignore uploaded files in development.
/storage/*
!/storage/.keep
/tmp/storage/*
!/tmp/storage/
!/tmp/storage/.keep
.byebug_history

# Ignore master key for decrypting credentials and more.
/config/master.key

.env
.env.test

## Environment normalization:
*.DS_Store
/vendor/bundle
/vendor/cache

# Terraform
.terraform
.terraform.lock.hcl
.vscode/launch.json

CODE
