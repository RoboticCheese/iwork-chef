# Encoding: UTF-8

attrs = node['resource_numbers_app_test']

numbers_app attrs['name'] do
  action attrs['action'] unless attrs['action'].nil?
end
