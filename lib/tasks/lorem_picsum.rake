require 'net/http'
require 'uri'

namespace :lorem_picsum do
  desc "Get accessible image ids from range, args example [\"1,100\"]"
  task :check_ids, [:start,:end] do |t, args|
    ids_range = (args[:start].to_i..args[:end].to_i)

    def image_exists?(url)
      URI.open(url)
      true
    rescue OpenURI::HTTPError
      false
    end

    good_ids = ids_range.select do |id|
      exist = image_exists? "https://picsum.photos/id/#{id}/1000/750"
      puts "checking: #{id}, result: #{exist.inspect}"
      exist
    end
    puts '============'
    puts 'result: '
    puts good_ids.to_a.inspect
  end
end
