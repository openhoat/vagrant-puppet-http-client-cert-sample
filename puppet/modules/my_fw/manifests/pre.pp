class my_fw::pre {

  Firewall {
    require => undef,
  }

	firewall { '003 allow http':
    action  => accept,
    proto   => tcp,
		state   => 'NEW',
    dport   => 80,
  }->
	firewall { '004 allow https':
    action  => accept,
    proto   => tcp,
		state   => 'NEW',
    dport   => 443,
  }

/* with purge set to true, the box will be blocked (bug?)

  firewall { '000 accept all icmp':
    action  => 'accept',
    proto   => 'icmp',
  }->
  firewall { '001 accept all to lo interface':
    action  => 'accept',
    proto   => 'all',
    iniface => 'lo',
  }->
  firewall { '002 accept ssh':
    action  => accept,
    proto   => tcp,
		state   => 'NEW',
    dport   => 22,
  }->
	firewall { '003 allow http':
    action  => accept,
    proto   => tcp,
		state   => 'NEW',
    dport   => 80,
  }->
	firewall { '004 allow https':
    action  => accept,
    proto   => tcp,
		state   => 'NEW',
    dport   => 443,
  }->
  firewall { '100 accept related established rules':
    proto   => 'all',
    state   => ['RELATED', 'ESTABLISHED'],
    action  => 'accept',
  }

*/

}
