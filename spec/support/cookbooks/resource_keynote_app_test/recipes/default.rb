# Encoding: UTF-8

attrs = node['resource_keynote_app_test']

keynote_app attrs['name'] do
  action attrs['action'] unless attrs['action'].nil?
end
