class my_fw::post {
  firewall { '999 drop all':
    proto   => 'all',
    action  => 'accept',
    before  => undef,
  }
}
