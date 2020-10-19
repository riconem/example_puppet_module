class example_puppet_module ()
{
  $dir = '/json_files'

  json_file { 'data':
    ensure => 'present',
    dir    => $dir,
    data   => { 'holy' => 'data'}
  }

  json_file { 'more_data':
    notify => Json_file['data'],
    ensure => 'present',
    dir    => $dir,
    data   => { 'holy' => 'data',
                'more' => 'data'}
  }
}
