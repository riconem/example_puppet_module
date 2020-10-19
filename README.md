# Example Puppet module
This is an example Puppet module of how to build custom resources for Puppet with [Types](lib/puppet/type) and [Providers](lib/puppet/provider).

### Example module tree for custom Types and Providers
```
example_puppet_module
├── lib
│   └── puppet
│       ├── provider
│       │   └── json_file
│       │       └── json.rb
│       └── type
│           └── json_file.rb
└── manifests
    └── init.pp
```
 
### How to use it in your Puppet manifest
```puppet
include example_puppet_module
 
json_file { 'data':
  ensure => 'present',
  dir    => '/yourdir',
  data   => { 'holy' => 'data'}
}
 ```
