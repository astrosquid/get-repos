require 'net/http'
require 'json'

token='SECRET'

puts ''
puts 'This util will clone all the public repos for a given user.'
puts "Make sure you're entering a valid GitHub username."
puts "Which user's repos would you like to clone?"


username = gets.chomp

uri = URI("https://api.github.com/users/#{username}/repos")
req = Net::HTTP::Get.new(uri)
req['Authorization'] = "token #{token}"
page = 1
req['page'] = "#{page.to_s}"
req['per_page'] = '100'
response = Net::HTTP.get_response(uri)
body = JSON.parse(response.body)

puts ''
puts 'Start cloning...'

repos = []
until body.empty?
  body.each do |repo| 
    puts repo['clone_url']
    # `git clone #{repo['clone_url']}`
  end
  req['page'] = "#{(page += 1).to_s}"
  response = Net::HTTP.get_response(uri)
  body = JSON.parse(response.body)
end

puts ''
puts 'Finished cloning.'
