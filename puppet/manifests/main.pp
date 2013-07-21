Exec { path => [ 
  "/vagrant/bin", 
  "/usr/local/sbin", 
  "/usr/local/bin", 
  "/sbin:/bin", 
  "/usr/sbin", 
  "/usr/bin" ] 
}

resources { "firewall":
/*
  purge => true
*/
  purge => false
}
Firewall {
  before  => Class['my_fw::post'],
  require => Class['my_fw::pre'],
}
class { ['my_fw::pre', 'my_fw::post']: }
class { 'firewall': }

class { 'selinux':
  mode => 'permissive'
}

package { "openssl":
    ensure => "installed"
}
exec { "create_certificates":
	command 	=> "create-certificates",
	logoutput => true,
  require   => Package["openssl"],
  creates   => "/vagrant/ssl-data/gen/client.p12",
}

class { 'apache': }
apache::vhost { 'non ssl host':
	servername => 'vagrant.centos64',
	port			 => 80,
  docroot    => '/vagrant/www-root',
}
apache::vhost { 'ssl host':
	servername      => 'vagrant.centos64',
	port			      => 443,
  docroot         => '/vagrant/sample-webapp',
	ssl             => true,
  ssl_cert        => '/vagrant/ssl-data/gen/certs/server-cert.pem',
  ssl_key         => '/vagrant/ssl-data/gen/private/server-key.pem',
  ssl_certs_dir   => '/vagrant/ssl-data/gen/certs',
  custom_fragment => template("/vagrant/puppet/templates/apache.conf.erb"),
}

