require 'spec_helper'

describe 'atom_editor' do

  context 'with Debian osfamily' do
    let :facts do
      {
        :osfamily  => 'Debian',
        :lsbdistid => 'Debian',
      }
    end

    download_url = 'https://atom.io/download/deb'

    it do
      should contain_package('atom').with(
        :ensure   => 'installed',
        :source   => '/tmp/atom.deb',
        :provider => 'dpkg',
      )

      should contain_exec('download-package').with(
        :command => "/bin/bash -c '/usr/bin/wget #{download_url} -O /tmp/atom.deb || /usr/bin/curl -L #{download_url} > /tmp/atom.deb'",
        :timeout => 600,
        :unless  => '/usr/bin/dpkg -s atom',
      )
     end
  end

  context 'with Fedora operatingsystem' do
    let :facts do
      {
        :osfamily        => 'RedHat',
        :operatingsystem => 'Fedora',
        :lsbdistid       => 'Fedora',
      }
    end

    download_url = 'https://atom.io/download/rpm'

    it do
      should contain_package('atom').with(
        :ensure   => 'installed',
        :source   => '/tmp/atom.rpm',
        :provider => 'rpm',
      )

      should contain_exec('download-package').with(
        :command => "/bin/bash -c '/usr/bin/wget #{download_url} -O /tmp/atom.rpm || /usr/bin/curl -L #{download_url} > /tmp/atom.rpm'",
        :timeout => 600,
        :unless  => '/usr/bin/rpm -q atom',
      )
    end
  end

  context 'with invalid osfamily' do
    let :facts do
      {
        :osfamily => 'Darwin',
      }
    end

    it 'should fail' do
      expect { subject }.to raise_error(/Unsupported operating system family/)
    end
  end

  context 'with overridden debian version' do
    let :facts do
      {
        :osfamily  => 'Debian',
        :lsbdistid => 'Debian',
      }
    end

    let :params do
      {
        :version => '0.179.0',
      }
    end

    download_url = 'https://github.com/atom/atom/releases/download/v0.179.0/atom-amd64.deb'

    it do
      should contain_package('atom').with(
        :ensure   => 'installed',
        :source   => '/tmp/atom.deb',
        :provider => 'dpkg',
      )

      should contain_exec('download-package').with(
        :command => "/bin/bash -c '/usr/bin/wget #{download_url} -O /tmp/atom.deb || /usr/bin/curl -L #{download_url} > /tmp/atom.deb'",
        :timeout => 600,
        :unless  => '/usr/bin/dpkg -s atom',
      )
    end
  end

  context 'with overridden red hat version' do
    let :facts do
      {
        :osfamily        => 'RedHat',
        :operatingsystem => 'Fedora',
        :lsbdistid       => 'Fedora',
      }
    end

    let :params do
      {
        :version => '0.179.0',
      }
    end

    download_url = 'https://github.com/atom/atom/releases/download/v0.179.0/atom.x86_64.rpm'

    it do
      should contain_package('atom').with(
        :ensure   => 'installed',
        :source   => '/tmp/atom.rpm',
        :provider => 'rpm',
      )

      should contain_exec('download-package').with(
        :command => "/bin/bash -c '/usr/bin/wget #{download_url} -O /tmp/atom.rpm || /usr/bin/curl -L #{download_url} > /tmp/atom.rpm'",
        :timeout => 600,
        :unless  => '/usr/bin/rpm -q atom',
      )
    end
  end
end
