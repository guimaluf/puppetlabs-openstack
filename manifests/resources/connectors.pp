class openstack::resources::connectors {

  $management_address = $::openstack::config::controller_address_management
  $password = $::openstack::config::mysql_service_password

  # keystone
  $user_keystone = $::openstack::config::mysql_user_keystone
  $pass_keystone = $::openstack::config::mysql_pass_keystone
  $keystone      = "mysql://${user_keystone}:${pass_keystone}@${management_address}/keystone"

  # cinder
  $user_cinder   = $::openstack::config::mysql_user_cinder
  $pass_cinder   = $::openstack::config::mysql_pass_cinder
  $cinder        = "mysql://${user_cinder}:${pass_cinder}@${management_address}/cinder"

  # glance
  $user_glance   = $::openstack::config::mysql_user_glance
  $pass_glance   = $::openstack::config::mysql_pass_glance
  $glance        = "mysql://${user_glance}:${pass_glance}@${management_address}/glance"

  # nova
  $user_nova     = $::openstack::config::mysql_user_nova
  $pass_nova     = $::openstack::config::mysql_pass_nova
  $nova          = "mysql://${user_nova}:${pass_nova}@${management_address}/nova"

  # neutron
  $user_neutron  = $::openstack::config::mysql_user_neutron
  $pass_neutron  = $::openstack::config::mysql_pass_neutron
  $neutron       = "mysql://${user_neutron}:${pass_neutron}@${management_address}/neutron"

  # heat
  $user_heat     = $::openstack::config::mysql_user_heat
  $pass_heat     = $::openstack::config::mysql_pass_heat
  $heat          = "mysql://${user_heat}:${pass_heat}@${management_address}/heat"
}
