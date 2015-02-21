# == Class: atom_editor
#
# Installs the Atom text editor.
#
# === Parameters
#
# [*version*]
#   Atom version to install. Defaults to 'latest' or can be a specific atom version number.
#
# [*ensure*]
#   Sets the package ensure attribute. Defaults to 'installed'.
#
# === Examples
#
#  include 'atom_editor'
#
#  class { atom_editor:
#    version => 'latest',
#  }
#
#  class { atom_editor:
#    version => '0.179.0',
#  }
#
# === Copyright
#
# Copyright 2015 James Netherton
#
class atom_editor(
  $version = $atom_editor::params::version,
  $ensure  = $atom_editor::params::ensure,
) inherits atom_editor::params {

  $packege_base_url      = 'https://github.com/atom/atom/releases/download'
  $package_download_name = "/tmp/${atom_editor::params::package_name}.${atom_editor::params::package_type}"

  case $version {
    'latest': {
      $package_file_name    = $atom_editor::params::package_type
      $package_download_url = "https://atom.io/download/${package_file_name}"
    }
    default: {
      $package_file_name    = "${atom_editor::params::package_name}${$atom_editor::params::package_seperator}${atom_editor::params::package_arch}.${atom_editor::params::package_type}"
      $package_download_url = "${packege_base_url}/v${version}/${package_file_name}"
    }
  }

  exec { 'download-package':
    command => "/bin/bash -c '/usr/bin/wget ${package_download_url} -O ${package_download_name} || /usr/bin/curl -L ${package_download_url} > ${package_download_name}'",
    timeout => 600,
    unless  => $package_installed_cmd,
  }
  ->
  package { $atom_editor::params::package_deps:
    ensure => installed,
  }
  ->
  package { $atom_editor::params::package_name:
    ensure   => $ensure,
    source   => $package_download_name,
    provider => $atom_editor::params::provider,
  }
}
