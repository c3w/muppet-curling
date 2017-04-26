class muppet inherits muppet::params {

/* ::muppet; c3w@juicypop.net
     DESCRIPTION: get your tunes
*/

## download image+soundfile w/ receipt

  notify { 'hello':
    message => "your sound is ${basename}.${sound_extension} and is ${basename}.${image_extension}"
  }

 # uneeded for v1
 # file { "$tmpdir/muppets.json":
 #   ensure  => present,
 #   content => template('muppet/json.erb')
 # }

  file { "${tmpdir}/.receipt.${basename}":
    ensure  => present,
    content => "[${basename}] v${version}",
  }

 /* download the image, if receipt doesn't exist;
    write the receipt, and notify sound download */

  exec { "${basename}_${image_extension}":
    command     => "curl ${base_url}/${basename}.${image_extension} \
                    -o ${tmpdir}/${basename}.${image_extension}",
    subscribe   => File["${tmpdir}/.receipt.${basename}"],
    notify      => Exec["${basename}_${sound_extension}"],
    refreshonly => true
  }

 ## require image download (if receipt doesn't exist), download soundfile
  exec { "${basename}_${sound_extension}":
    command     => "curl ${base_url}/${basename}.${sound_extension} \
                     -o ${tmpdir}/${basename}.${sound_extension}",
    require     => Exec["${basename}_${image_extension}"],
    refreshonly => true
  }


}
