echo create database isucon5q | mysql -uroot
mysql -uroot isucon5q < sql/schema.sql

cd script
bundle install -j4
bundle exec ruby gen.rb gen_users >/dev/null
bundle exec ruby gen.rb gen_relations >/dev/null
bundle exec ruby gen.rb gen_entries >/dev/null
bundle exec ruby gen.rb gen_comments >/dev/null
bundle exec ruby gen.rb gen_footprints >/dev/null
bundle exec ruby check_testsets.rb
