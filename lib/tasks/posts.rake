namespace :posts do
  desc "TODO"
  task delete_after_7_days: :environment do
    Post.where(['created_at < ?', 7.days.ago]).destroy_all
  end

end
