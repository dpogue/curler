Curler
======

Log Net::HTTP requests as cURL commands.


Installation
------------

* Github: https://github.com/dpogue/curler

* Gem:

  ```
  $ gem install curler
  ```

* Bundler/Gemfile:

  ```ruby
  gem 'curler'
  ```

Usage
-----

This adds a class-level `curl_log` method to Net::HTTP to specify a log location for the cURL commands.

```ruby
# Set the output location, as either a string or an IO object
Net::HTTP.curl_log('requests.log')

# Now make requests with Net::HTTP
```

Contributing
------------

Contributions of bug reports, feature requests, and pull requests are greatly appreciated!

Please note that this project is released with a [Contributor Code of Conduct](https://github.com/dpogue/curler/blob/master/CODE_OF_CONDUCT.md). By participating in this project you agree to abide by its terms.


Licence
-------

Copyright © 2018 Darryl Pogue
Licensed under the MIT Licence.
