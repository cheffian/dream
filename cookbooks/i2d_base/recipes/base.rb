include_recipe "apt"

base_packages=%w(apt vim lsof curl wget ncdu ack-grep elinks git tree)
package base_packages

execute "update system time" do
  command 'ntpdate ntp.ubuntu.com'
  user 'root'
end

if node[:i2d_base][:route53]
  include_recipe "i2d_base::_r53"
end
