require 'net/http'

class Net::HTTP
  @@logfile = nil

  def self.curl_log(path)
    if path.is_a? String
      @@logfile = File.open(path, 'at')
    elsif path.is_a? IO
      @@logfile = path
    elsif path.nil?
      @@logfile = nil
    else
      raise AttributeError.new('Invalid value for path')
    end
  end


  # Monkey-patch the request method
  alias_method :old_request, :request

  def request(req, body=nil, &block)
    # Need to make the request in order to set some useful stuff in the
    # request object
    unless started?
      start {
        req['connection'] ||= 'close'
        res = old_request(req, body, &block)
      }
    else
      res = old_request(req, body, &block)
    end


    if @@logfile
      if use_ssl?
        url = "https://#{address}"

        if port != 443
          url += ":#{port}"
        end
      else
        url = "http://#{address}"

        if port != 80
          url += ":#{port}"
        end
      end
      url += "#{req.path}"

      method = "-X #{req.method.upcase}"

      headers = []
      req.each_capitalized do |key, value|
        headers << "-H \"#{key}: #{value}\""
      end

      if req.request_body_permitted?
        data = "-d \"#{req.body}\""
      else
        data = ''
      end

      output = ['curl', method, headers.join(' '), data, url].reject(&:empty?)

      @@logfile << (output.join(' ') + "\n")
    end

    return res
  end
end
