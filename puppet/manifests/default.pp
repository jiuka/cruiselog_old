node default {
  
  ensure_packages(['bundler', 'postgresql-server-dev-9.3'])

  class { 'postgresql::server': } 
  class { 'postgresql::server::postgis': } 

  postgresql::server::role { 'vagrant':
    superuser => true,
    password  => postgresql_password('cruiselog','queenmary2'),
  }

  postgresql::server::pg_hba_rule { 'allow to access db':
    description => 'allow to access db',
    order       => '001',
    type        => 'local',
    database    => 'all',
    user        => 'vagrant',
    auth_method => 'ident',
  }

  apt::ppa { 'brightbox/ruby-ng': } ->
  package { [ 'ruby2.1', 'ruby2.1-dev' ]: )

}
