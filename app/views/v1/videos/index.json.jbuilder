json.array! @videos do |video|
  json.partial! "v1/videos/video", video: video
end
