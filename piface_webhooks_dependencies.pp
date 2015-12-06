# piface_webhooks_dependencies.pp
#
# Puppet manifest to install system-level dependencies for piface-webhooks
#
# The latest version of this package is available at:
# <https://github.com/jantman/piface_webhooks>
#
################################################################################
# Copyright 2015 Jason Antman <jason@jasonantman.com> <http://www.jasonantman.com>
#
#    This file is part of piface_webhooks.
#
#    piface_webhooks is free software: you can redistribute it and/or modify
#    it under the terms of the GNU Affero General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    piface_webhooks is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU Affero General Public License for more details.
#
#    You should have received a copy of the GNU Affero General Public License
#    along with piface_webhooks.  If not, see <http://www.gnu.org/licenses/>.
#
# The Copyright and Authors attributions contained herein may not be removed or
# otherwise altered, except to add the Author attribution of a contributor to
# this work. (Additional Terms pursuant to Section 7b of the AGPL v3)
################################################################################
# While not legally required, I sincerely request that anyone who finds
# bugs please submit them at <https://github.com/jantman/piface_webhooks> or
# to me via email, and that you send any contributions or improvements
# either as a pull request on GitHub, or to me via email.
################################################################################
#
# AUTHORS:
# Jason Antman <jason@jasonantman.com> <http://www.jasonantman.com>
################################################################################

if $::osfamily != 'Debian' {
  fail("piface-webhooks Puppet is only compatible with Debian.")
}

# this installs python3, python3-pip, python3-dev and python3-virtualenv
class {'python':
  ensure     => 'present',
  version    => '3',
  pip        => 'present',
  dev        => 'present',
  virtualenv => 'present',
}

# this creates a python3 virtualenv at /usr/local/piface-webhooks
python::virtualenv {'/usr/local/piface-webhooks':
  ensure  => present,
  version => '3',
  owner   => 'root',
  group   => 'root',
  require => [Class['python'], Package['virtualenv']],
}
