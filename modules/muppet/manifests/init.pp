class muppet inherits muppet::params {

  notify { 'hello':
    message => "your sound is ${basename}.${sound_extension} and is ${basename}.${image_extension}"
  }

 // uneeded for v1
 // file { "$tmpdir/muppets.json":
 //   ensure  => present,
 //   content => template('muppet/json.erb')
 // }

 // download the image, if receipt doesn't exist;
 // write the receipt, and notify sound download
 exec { "${basename}_${image_extension}":
  cwd     => "/usr/bin",
  command => "curl ${base_url}/${basename}.${image_extension}" \
               "-o ${tmpdir}/${basename}.${image_extension} && " \
               "touch ${tmpdir}/.receipt.${basename}",
  creates => "${tmpdir}/.receipt.${basename}",
  notify  => Exec["${basename}_${sound_extension}"]
}

 // on notify from image download, (if receipt doesn't exist), download soundfile
 exec { "${basename}_${sound_extension}":
  cwd         => "/usr/bin",
  command     => "curl ${base_url}/${basename}.${sound_extension} " \
                   "-o ${tmpdir}/${basename}.${sound_extension}",
  refreshonly => true
}

}
