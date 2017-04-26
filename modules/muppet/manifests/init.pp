class muppet inherits muppet::params {

  notify { 'hello':
    message => "your image is $basename.$image_extension"
  }

}
