# ruby-nodia - diacritic stripper

+ [github project] (https://github.com/geronime/ruby-nodia)

ruby-nodia is a simple module to convert text to ASCII using Unicode NFD
and additional substitutions/transliterations.

The algorithm is pretty much the same as
[here] (http://ahinea.com/en/tech/accented-translate.html).

## Usage:

    require 'ruby-nodia'
    ascii = NoDia.strip utf8text

## Changelog:

+ __0.0.1__: first revision of diacritic stripper

## License:

ruby-nodia is copyright (c)2012 Jiri Nemecek, and released under the terms
of the MIT license. See the LICENSE file for the gory details.

