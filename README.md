#puppet-atom-editor

##Overview

Puppet module to install the [Atom text editor](https://atom.io/).

##Tested on:

* Fedora 21
* Ubuntu 14.10 (Utopic Unicorn)

##Usage

To install the latest version of Atom, include or declare the atom_editor class.

```puppet
include 'atom_editor'
```

```puppet
class { 'atom_editor':
}
```

To install an older version of Atom, set the appropriate version attribute.

```puppet
class { 'atom_editor':
  version => '0.179.0',
}
```

##Mit License

The MIT License (MIT)

Copyright (c) 2015 James Netherton

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
