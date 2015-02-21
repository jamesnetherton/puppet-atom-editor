class atom_editor::params() {
  $ensure           = installed
  $version          = latest
  $package_name     = 'atom'

  case $::osfamily {
    'RedHat': {
      $provider              = 'rpm'
      $package_type          = 'rpm'
      $package_arch          = 'x86_64'
      $package_deps          = ['gtk2','GConf2']
      $package_seperator     = '.'
      $package_installed_cmd = '/usr/bin/rpm -q atom'
    }
    'Debian': {
      $provider              = 'dpkg'
      $package_type          = 'deb'
      $package_arch          = 'amd64'
      $package_deps          = ['git','gconf2','gconf-service','libgtk2.0-0','libnotify4','libxtst6','libnss3','python','gvfs-bin','xdg-utils']
      $package_seperator     = '-'
      $package_installed_cmd = '/usr/bin/dpkg -s atom'
    }
    default: {
      fail("Unsupported operating system family ${::osfamily}")
    }
  }
}
