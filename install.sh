echo create database isucon5q | mysql -uroot
mysql -uroot < sql/schema.sql

cd script
bundle install -j4
bundle exec ruby gen_users.rb >/dev/null
bundle exec ruby gen_relations.rb >/dev/null
bundle exec ruby gen_entries.rb >/dev/null
bundle exec ruby gen_comments.rb >/dev/null
bundle exec ruby gen_footprints.rb >/dev/null
bundle exec ruby check_testsets.rb
