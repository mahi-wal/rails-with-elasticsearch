namespace :db do
  desc 'Indexing users'
 task create_index_for_user: :environment do
  puts 'Indexing users ......'
  User.__elasticsearch__.create_index!
  puts 'completed Indexing users ......'
 end

 task import_user: :environment do
  puts 'importing users ......'
  User.find_in_batches do |batch|
    batch.each do |user|
      user.__elasticsearch__.index_document
    end
  end
  puts 'completed importing users  ......'
 end
end