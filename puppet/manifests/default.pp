node default {
  
  ensure_packages(['bundler', 'postgresql-server-dev-9.3'])

  class { 'postgresql::server': } 
  class { 'postgresql::server::postgis': } 

  postgresql::server::db { 'cruiselog_development':
    user     => 'vagrant',
    password => postgresql_password('cruiselog','queenmary2'),
  }

  postgresql::server::pg_hba_rule { 'allow to access db':
    description => 'allow to access db',
    order       => '001',
    type        => 'local',
    database    => 'all',
    user        => 'vagrant',
    auth_method => 'ident',
  }

}
