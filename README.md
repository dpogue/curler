# Curler

Log Net::HTTP requests as cURL commands.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'curler'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install curler


## Usage

This adds a class-level `curl_log` method to Net::HTTP to specify a log location for the cURL commands.

```ruby
# Set the output location, as either a string or an IO object
Net::HTTP.curl_log('requests.log')

# Now make requests with Net::HTTP
```
