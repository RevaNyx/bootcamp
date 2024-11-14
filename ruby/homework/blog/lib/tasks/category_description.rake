namespace :category do
    desc "Backfill category descriptions"
    task backfill_descriptions: :environment do
      Category.find_each do |category|
        category.update(description: "Default description") unless category.description.present?
      end
    end
  end
  