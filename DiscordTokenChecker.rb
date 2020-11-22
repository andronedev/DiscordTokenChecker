#https://discordapp.com/api/v7/users/@me

require 'net/http'
require 'uri'
require 'openssl'
require 'Faraday'
require 'json'
require 'thread'
require 'thwait'
require 'net_http_ssl_fix'

Gem.win_platform? ? (system "cls") : (system "clear")
puts ''
puts '██████╗ ██╗███████╗ ██████╗ ██████╗ ██████╗ ██████╗   ████████╗ ██████╗ ██╗  ██╗███████╗███╗   ██╗'
puts '██╔══██╗██║██╔════╝██╔════╝██╔═══██╗██╔══██╗██╔══██╗  ╚══██╔══╝██╔═══██╗██║ ██╔╝██╔════╝████╗  ██║'
puts '██║  ██║██║███████╗██║     ██║   ██║██████╔╝██║  ██║     ██║   ██║   ██║█████╔╝ █████╗  ██╔██╗ ██║'
puts '██║  ██║██║╚════██║██║     ██║   ██║██╔══██╗██║  ██║     ██║   ██║   ██║██╔═██╗ ██╔══╝  ██║╚██╗██║'
puts '██████╔╝██║███████║╚██████╗╚██████╔╝██║  ██║██████╔╝     ██║   ╚██████╔╝██║  ██╗███████╗██║ ╚████║'
puts '╚═════╝ ╚═╝╚══════╝ ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚═════╝      ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═══╝'
puts '                                                                                   '
puts ' ██████╗██╗  ██╗███████╗ ██████╗██╗  ██╗███████╗██████╗                            '
puts '██╔════╝██║  ██║██╔════╝██╔════╝██║ ██╔╝██╔════╝██╔══██╗                           '
puts '██║     ███████║█████╗  ██║     █████╔╝ █████╗  ██████╔╝                           '
puts '██║     ██╔══██║██╔══╝  ██║     ██╔═██╗ ██╔══╝  ██╔══██╗                           '
puts '╚██████╗██║  ██║███████╗╚██████╗██║  ██╗███████╗██║  ██║                           '
puts ' ╚═════╝╚═╝  ╚═╝╚══════╝ ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝                           '
puts ''
puts 'By Andronedev - t.me/andronedev | v1.0.0 - May 29, 2020'
puts ''
puts 'All hits are saved to hits.txt'
puts ''
puts 'Press Enter to start'

gets
file='tokenstocheck.txt'
File.readlines(file).each do |tk|
  Thread.new { 
  tk = tk.sub(/\n+\Z/, '')

  uri = URI.parse("https://discordapp.com/api/v8/users/@me")
  request = Net::HTTP::Get.new(uri)
  request["authorization"] = tk
  req_options = {
    use_ssl: uri.scheme == "https",
  }

  capture = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
    http.request(request)
  end

  captureJson = JSON.parse(capture.body)
  if captureJson["id"] != nil
    
          puts "#{tk} | Verified : #{captureJson['verified']} | #{captureJson["username"]}##{captureJson["discriminator"]} | #{captureJson["id"]} | #{captureJson["email"]} | two-factor authentication : #{captureJson['mfa_enabled']}"
          
          f = File.open("hits.txt", "a+")
          f.puts("#{tk} | Verified : #{captureJson['verified']} | #{captureJson["username"]}##{captureJson["discriminator"]} | #{captureJson["id"]} | #{captureJson["email"]} | two-factor authentication : #{captureJson['mfa_enabled']}")
      f.close
    
  else
    puts "#{tk} - Invalide"
      
  end
}
sleep(0.1)
end

Thread.list.each{ |t| t.join unless t == Thread.current }

puts "End ! (enter to exit)"
gets
