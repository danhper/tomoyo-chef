name 'tomoyo'
maintainer 'Daniel Perez'
maintainer_email 'tuvistavie@gmail.com'
license 'MIT'
description 'Installs and configures TOMOYO Linux'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.1.2'

recipe "tomoyo::default", "TOMOYO Linux Installation"

%w{ apt tomoyo }.each do |dep|
  depends dep
end

%w{ debian ubuntu }.each do |os|
  supports os
end
