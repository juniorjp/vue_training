namespace :video do

  desc "Import videos from external API"
  task :import => :environment do
    response = HTTParty.get('https://fwfg.com/api/contents?category_id=23751')
    videos = JSON.parse(response.body)
    videos.each do |video|
      video = video.with_indifferent_access
      Video.create(
        title: video[:title],
        description: video[:description],
        duration: video[:duration],
        main_poster: video[:main_poster],
        gif_preview: video[:gif_preview],
        external_id: video[:id]
      )
    end
  end
end
    
