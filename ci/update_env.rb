require 'nokogiri'

doc = File.open('./ci/environment-mac.xml') { |f| Nokogiri::XML(f) }
File.open('./environment.xml', 'w') do |f|
  doc.at_xpath("//parameter[name=\'Mobile device(s)\']/value").content = ARGV[0]
  doc.at_xpath("//parameter[name=\'OS\']/value").content = %x$sw_vers -productVersion$.match(/[\d]*\.[\d]*\.[\d]*/)
  doc.at_xpath("//parameter[name=\'XCode\']/value").content = %x$xcodebuild -version$.match(/[\d]*\.[\d]*\.[\d]*/)
  doc.at_xpath("//parameter[name=\'Ruby\']/value").content = %x$allure --version$.match(/[\d]*\.[\d]*\.[\d]*/)
  doc.at_xpath("//parameter[name=\'Java\']/value").content = %x$java --version$.match(/[\d]*\.[\d]*\.[\d]*/)
  f.puts doc
end

File.open('./report/environment.xml', 'w+') {|file| file.write(doc)}