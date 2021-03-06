# The profile to install rabbitmq and set the firewall
class openstack::profile::rabbitmq {
  $management_address = $::openstack::config::controller_address_management

  if $::osfamily == 'RedHat' {
    package { 'erlang':
      ensure  => installed,
      before  => Package['rabbitmq-server'],
      require => Yumrepo['erlang-solutions'],
    }
  }

  rabbitmq_user { $::openstack::config::rabbitmq_user:
    admin    => true,
    password => $::openstack::config::rabbitmq_password,
    require  => Class['::rabbitmq'],
  }
  rabbitmq_user_permissions { "${openstack::config::rabbitmq_user}@/":
    configure_permission => '.*',
    write_permission     => '.*',
    read_permission      => '.*',
  }->Anchor<| title == 'nova-start' |>

  class { '::rabbitmq':
    service_ensure    => 'running',
    port              => 5672,
    delete_guest_user => true,
  }
}
