# muppet curling

![_animal](https://raw.githubusercontent.com/c3w/muppet-curling/master/_animal.png)

*codetest* **in puppet**

*TIMESPENT < 6hrs*

* [https://github.com/c3w/muppet-curling](https://github.com/c3w/muppet-curling)

{modules}

* [https://github.com/c3w/mc-muppet](https://github.com/c3w/mc-muppet)



### purpose
ordered and templatized image and soundfile download, with a creates=>receipt

### notes (of note)
* coding style
* idempotent
* rspec full test coverage
* modular
* git-flow workflow / pull-requests
* namespacing
* gitignore
* documentation

### expected output
`$ librarian-puppet install`

`$ puppet apply --modulepath=./modules manifests/site.pp`

. . .

Notice: /Stage[main]/Muppet/Notify[hello]/message: defined 'message' as 'your sound is timezone.mp3 and is timezone.png'

Notice: /Stage[main]/Muppet/File[/tmp/.receipt.timezone]/ensure: defined content as '{md5}66d80bd734435a64b0594ed04a28b00b'

Notice: /Stage[main]/Muppet/Exec[timezone_png]:
 Triggered 'refresh' from 1 events

Notice: /Stage[main]/Muppet/Exec[timezone_mp3]: Triggered 'refresh' from 1 events


. . . 

`$ sleep 5`

`$ puppet apply --modulepath=./modules manifests/site.pp`

Notice: your sound is timezone.mp3 and is timezone.png

`$ rm /tmp/.receipt.timezone`
 
`$ puppet apply --modulepath=./modules manifests/site.pp`

Notice: /Stage[main]/Muppet/File[/tmp/.receipt.timezone]/ensure: defined content as '{md5}66d80bd734435a64b0594ed04a28b00b'

Notice: /Stage[main]/Muppet/Exec[timezone_png]: Triggered 'refresh' from 1 events

Notice: /Stage[main]/Muppet/Exec[timezone_mp3]: Triggered 'refresh' from 1 events

:)

### tdd
`$ cd modules/muppet`
`$ rake spec`

2 examples, 0 failures


### ps
i committed directly to master a few times.. sry! won't happen again :P

*--c3w*
