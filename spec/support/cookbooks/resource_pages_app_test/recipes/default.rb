# Encoding: UTF-8

attrs = node['resource_pages_app_test']

pages_app attrs['name'] do
  action attrs['action'] unless attrs['action'].nil?
end
