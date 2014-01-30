def seed_votes(created_date, ip_address)
  WineApp.all.each do |wine_app|
    33.times do |i|
      Vote.seed do |v|
        difficulty_value = rand(0..100)
        quality_value = difficulty_value + rand(-10..10)
        quality_value = quality_value.round(-2) unless (0..100).include? quality_value
        v.difficulty_value = difficulty_value
        v.quality_value = quality_value
        v.ip_address = ip_address.succ!
        v.wine_app_id = wine_app.id
        v.created_at = created_date
      end
    end
  end
end

seed_ip_address = '192.168.1.001'
seed_votes(Date.today, seed_ip_address)
seed_votes(Date.today - 3.months, seed_ip_address)
seed_votes(Date.today - 6.months, seed_ip_address)