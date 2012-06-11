# Lets tell Puppet the order of our stages
stage { 
  'users':      before => Stage['updates'];
  'updates':    before => Stage['packages'];
  'packages':   before => Stage['configure'];
  'configure':  before => Stage['services'];
  'services':   before => Stage['main'];
}

class services {
  #we want apache and mongo to be running when the server boots
  service { 
    'apache2':  ensure => running, enable => true
    #if your using mysql please remove the comment below
    #'mysql':    ensure => running, enable => true;
  }
}

class configure {
  # I know where apache conf's should go but for convinience im putting them with the project,
  # So i must include the folder in httpd.conf
  file { 
    '/etc/apache2/httpd.conf' :
      content => 'Include /home/vagrant/apache'
  }
}

class packages {
  package {
    "apache2":  ensure => "present";
    "php5":     ensure => "present"; # PHP5

    # Uncomment the line below for git
    #"git-core":         ensure => "present";

    #If you need mysql copy the two lines below
    #"mysql-server-5.1": ensure => "present";
    #"php5-mysql":       ensure => "present";
  }
}

class updates {
  # we must run apt-get update before we install our packaged because we installed some repo's
  exec { "apt-update":
    command => "/usr/bin/apt-get update -y -q",
    timeout => 0
  }
}

class users
{
  #add your users and groups here
  group { "puppet":
    ensure => "present",
  }
}

# Here we are linking our classes to stages
class { 
# class: stage => "stagename";
  users:      stage => "users";
  updates:    stage => "updates";
  packages:   stage => "packages";
  configure:  stage => "configure";
  services:   stage => "services";
}