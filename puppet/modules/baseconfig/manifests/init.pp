# == Class: base
#
# Performs initial configuration tasks for all Vagrant boxes.
#
class baseconfig {
  exec { 'yum update':
    command => '/usr/bin/yum -y update',
    #user => root,
  }

  exec {'start puppet':
    command => '/etc/rc.d/init.d/puppet start',
    user => root,
  }

}

# Ensure that these packages are present
class base-packages {
  package{"perl-ExtUtils-MakeMaker":
    ensure => present,
  }
  package{"gettext-devel":
    ensure => present,
  }
  package{"asciidoc":
    ensure => present,
  }
  package{"xmlto":
    ensure => present,
  }
}

class git (
  $provider = 'source',
  $version  = 'latest') {

  case $provider {
    'source' : {

      exec {"wget https://github.com/git/git/archive/v1.8.5.zip && unzip v1.8.5 && cd git-1.8.5 && make configure &&  ./configure && make all doc && make install install-doc install-html" :
        cwd       =>  '/root',
        user      =>  'root',
        path      =>  ['/usr/local/bin', '/bin', '/usr/bin'],
        timeout   =>  0,
        logoutput =>  on_failure,
        unless    =>  "/bin/bash -c \"[[ `git --version | cut -d\' \' -f3` = \'${version}\'* ]]\"",
        provider  =>  'shell',
      }
      $git_daemon = '/usr/local/libexec/git-core/git-daemon'
    }
    default : { fail("[git] The provider you selected ${provider} is not valid") }
  }
}

# You may want to include these if you need to poke around the box
# They're not essential to running the application
class niceties {
  package{"man":
    ensure => present,
  }
  package{"vim":
    ensure => present,
  }
}

class rvm-ruby {
  exec{"install-rvm":
    command => "/usr/bin/curl -sSL https://get.rvm.io | /bin/bash -s stable",
    creates => "/usr/local/rvm",
    timeout => '0'
  }
  exec{"install-ruby-1.9":
    command => "/usr/local/rvm/bin/rvm install ruby-1.9.3-p448",
    creates => "/usr/local/rvm/rubies/ruby-1.9.3-p448",
    timeout => '0'
  }
    exec{"install-ruby-2.0":
    command => "/usr/local/rvm/bin/rvm install ruby-2.0.0-p353",
    creates => "/usr/local/rvm/rubies/ruby-2.0.0-p353",
    timeout => '0'
  }
  exec{"set-default-ruby":
    command => "/usr/local/rvm/bin/rvm alias create default ruby-2.0.0-p353",
    creates => "/usr/local/rvm/rubies/default",
    timeout => '0'
  }

  Exec["install-rvm"] -> Exec["install-ruby-1.9"] -> Exec["install-ruby-2.0"] -> Exec["set-default-ruby"]

}

class rvm-users {
  user{"vagrant":
    ensure => present,
    groups => "rvm",
  }
}
