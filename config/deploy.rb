# config valid for current version and patch releases of Capistrano
lock "~> 3.16.0"

set :application, "photo_share_app"
set :repo_url, "git@github.com:beni426/kadai10.git"


# deployするブランチ。デフォルトでmainを使用している場合、masterをmainに変更してください。
set :branch, ENV['BRANCH'] || 'master'

# deploy先のディレクトリ。
set :deploy_to, '/var/www/photo_share_app'

# シンボリックリンクをはるフォルダ・ファイル
set :linked_files, %w{.env config/secrets.yml}
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets public/uploads}

# 保持するバージョンの個数(※後述)
set :keep_releases, 5

# Rubyのバージョン
set :rbenv_ruby, '3.1.0'
set :rbenv_type, :system

# 出力するログのレベル。エラーログを詳細に見たい場合は :debug に設定する。
# 本番環境用のものであれば、 :info程度が普通。
# ただし挙動をしっかり確認したいのであれば :debug に設定する。
set :log_level, :info

namespace :deploy do
  desc 'Restart application'
  task :restart do
    invoke 'unicorn:restart'
  end

  desc 'Create database'
  task :db_create do
    on roles(:db) do |host|
      with rails_env: fetch(:rails_env) do
        within current_path do
          execute :bundle, :exec, :rake, 'db:create'
        end
      end
    end
  end

  desc 'Run seed'
  task :seed do
    on roles(:app) do
      with rails_env: fetch(:rails_env) do
        within current_path do
          execute :bundle, :exec, :rake, 'db:seed'
        end
      end
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
    end
  end
end
