# Gloc(k) Model 17 - 9mm

`gloc` is an opinionated utility to count lines of code.

* it groups files based on their file extension, instead of trying to guess their language and grouping them that way
* it doesn't ignore files just because it doesn't recognise them _(ie. cannot correctly guess their language)_
* in a git repo, it processes `$( git ls-files )` by default
* in a non-git repo, it processes `$( find . -type f)` by default
* it generates human-friendly, `loc`-alike output
* it is Unix pipeline friendly, by design:
   * it reads the list of filenames to process from `stdin` if `[ ! -t 0 ]`
   * it writes machine-parsable JSON output to `stdout` if `[ ! -t 1 ]`

## Example

For the popular Ruby on Rails framework, `gloc` generates the following `loc`-alike output:

    --------------------------------------------------------------------------------
     Language             Files        Lines        Blank      Comment         Code
    --------------------------------------------------------------------------------
     *.rb                 2,149      304,495       47,846       42,651      213,998
     *.md                    74       49,604       14,204            0       35,400
     *.js                    39        9,717        1,452          564        7,701
     *.yml                  150        3,367          278            0        3,089
     *.erb                  408        2,183          254            0        1,929
     *                       81        2,255          392            0        1,863
     *.css                   24        1,640          214           32        1,394
     *.coffee                24        1,190          197            0          993
     *.rake                  16          864          137            0          727
     *.rdoc                  11          985          352            0          633
     *.tt                    28          515           88            0          427
     *.lock                   1          437           11            0          426
     *.yaml                   1          231            1            0          230
     *.gemspec               11          306           79            0          227
     *.html                  28          225           15            3          207
     *.json                   3           65            0            0           65
     *.builder               19           62            2            0           60
     *.y                      1           50            4            0           46
     *.sql                    1           49            6            0           43
     *.zoo                    2            8            0            0            8
     *.ru                     2            8            2            0            6
     *.txt                    6            6            0            0            6
     *.ruby                   2            4            0            0            4
     *.erb~                   4            4            0            0            4
     *.raw                    2            2            0            0            2
     *.styles                 1            1            0            0            1
     *.log                    1            1            0            0            1
     *.dtd                    1            1            0            0            1
     *.mab                    1            1            0            0            1
     *.javascript             1            1            0            0            1
    --------------------------------------------------------------------------------
     Total                3,092      378,277       65,534       43,250      269,493
    --------------------------------------------------------------------------------

## What It Is Not!

For various reasons, none of these existing utilities to count lines of code are fit for _(my)_ purpose:

* [cgag/loc](https://github.com/cgag/loc)
* [AlDanial/cloc](https://github.com/AlDanial/cloc)
* [Aaronepower/tokei](https://github.com/Aaronepower/tokei)
* [SLOCCount](http://www.dwheeler.com/sloccount/)

## Installation

    gem install gloc

## Usage

The simplest way to use `gloc` is to simply run:

    gloc

It should behave pretty much as you'd expect!

### in a git repo

In a git repo, running `gloc` will process all files known to git, so is roughly equivalent to:

    git ls-files | gloc

### in a non-git repo

In a non-git repo, running `gloc` will process all files in the directory, so is roughly equivalent to:

    find . -type f | gloc

## Sorting

The results are sorted by "lines of code" by default _(with "lines of code" defined as lines that aren't blank or comment-only)_ but the following options are supported to sort the results differently:

    gloc -files     # sort by number of files
    gloc -lines     # sort by the total number of lines
    gloc -blank     # sort by the number of blank lines
    gloc -comment   # sort by the number of comment lines
    gloc -code      # sort by lines of code (default)

## Known Issues

* identify comment-only lines for a lot more languages
* support more file encodings (not just `UTF-8` and `ISO-8859-1`)

* (?) installation via Homebrew
* (?) convert script to Perl for performance

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/pvdb/gloc. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
