require 'net/ping'
require 'rest-client'
require 'json'
require 'date'

class NetChecker

  # Пинг по указанному url
  def self.ping(url, count = 5, interval = 1, timeout = 6)
    Net::Ping::External.new.ping?(url, count, interval, timeout)
  end

  # Проверка на доступность хоста
  def self.check_host(url)
    begin
      if ping(IPSocket::getaddress(url))
        return true
      end
    rescue
      NetChecker.log("[CONNECTION CHECK][ERROR] Problem with host connection!\n")
      $fail_net = true
      return false
    end
  end

  # Проверка на наличие корректного подключения к сети
  def self.check_network
    unless ping('google.com') && ping('yandex.ru')
      NetChecker.log("[CONNECTION CHECK][ERROR] Problem with ping connection!\n")
      $fail_net = true
      return false
    end
    return true
  end

  # Проверка запроса user/name
  def self.check_user(url, name)
    begin
      response = RestClient.get('https://' + url + '/user/' + name, headers={})
      NetChecker.log("[CONNECTION CHECK] Checking request user/name\n")
      NetChecker.log("[CONNECTION CHECK] Status of response: #{response.code}\n")
      if response.code != 200
        NetChecker.log("[CONNECTION CHECK][ERROR] Request user/name is failed!\n")
        $fail_net = true
        return false
      end
      return true
    rescue
      NetChecker.log("[CONNECTION CHECK][ERROR] Request /user/name is failed!\n")
      $fail_net = true
      return false
    end
  end

  def self.all_checks(url = 'reddit.com', name = 'ejfjs')
    NetChecker.log(Time.now.strftime("[CONNECTION CHECK] Ping network is successful\n")) if check_network
    NetChecker.log(Time.now.strftime("[CONNECTION CHECK] Connection to host is successful\n")) if check_host(url)
    NetChecker.log(Time.now.strftime("[CONNECTION CHECK] Request /user/name is successful\n")) if check_user(url, name)
  end

  def self.run
    try = 1
    exit = false
    NetChecker.log("[CONNECTION CHECK] Checking for #{$feature}\n")
    until exit do
      $fail_net = false
      NetChecker.log("[CONNECTION CHECK] Try ##{try}\n")
      NetChecker.all_checks
      if $fail_net
        if try < 10
          NetChecker.log("[CONNECTION CHECK][ERROR] Wait 60 seconds!\n")
          sleep 60
          try += 1
        else
          NetChecker.log("[CONNECTION CHECK][ERROR] Problem with connection to network!\n")
          NetChecker.log("[CONNECTION CHECK][ERROR] Tests is stopped!\n")
          $crash = true
          exit = true
        end
      else
        NetChecker.log("[CONNECTION CHECK] Network connection is successful\n")
        exit = true
      end
    end
  end

  def self.log(mess, path: './report/network_status.log')
    text = Time.now.strftime('%Y-%m-%d %H:%M:%S ') + mess
    puts text
    File.open(path, 'a') {|file| file.puts text}
  end

end

NetChecker.run