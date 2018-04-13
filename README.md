# Pikk

Generic Algorithm Pool Selection.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pikk'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pikk

## Usage

  > **WARNING!**
  > **Your hash should have the keys `:name` and `:weight`!**

There are two methods. One is `single_select` and the other is `pool`. Former, select one hash object from the array by its weight, and return it. Latter, do an iteration of selection, 50 by default, and return the array. See [examples/](https://github.com/aoozdemir/pikk/blob/master/examples/object_example.rb) for more.

```ruby
require 'pikk'

ary = [{name: 'a', weight: 5.5}, {name: 'b', weight: 3}, {name: 'c', weight: 7}, {name: 'd', weight: 1.5}]

Pikk.single_select(ary)
# => {:name=>"c", :weight=>7, :count=>0, :probability=>0.4117647058823529}

Pikk.pool(ary)
# => [{:name=>"c", :weight=>7, :count=>22, :probability=>0.4117647058823529}, {:name=>"a", :weight=>5.5, :count=>15, :probability=>0.3235294117647059}, {:name=>"b", :weight=>3, :count=>8, :probability=>0.17647058823529413}, {:name=>"d", :weight=>1.5, :count=>5, :probability=>0.08823529411764706}]

Pikk.pool(ary, iteration: 100)
# => [{:name=>"c", :weight=>7, :count=>37, :probability=>0.4117647058823529}, {:name=>"a", :weight=>5.5, :count=>34, :probability=>0.3235294117647059}, {:name=>"b", :weight=>3, :count=>18, :probability=>0.17647058823529413}, {:name=>"d", :weight=>1.5, :count=>11, :probability=>0.08823529411764706}]

Pikk.pool(ary, pp: true)
# =>
# +-----------------+--------+-------+---------------------+--------------------+
# | Name            | Weight | Count | Probability         | (C/(P*I))          |
# +-----------------+--------+-------+---------------------+--------------------+
# | a               | 5.5    | 19    | 0.3235294117647059  | 1.1745454545454546 |
# | b               | 3      | 8     | 0.17647058823529413 | 0.9066666666666666 |
# | c               | 7      | 19    | 0.4117647058823529  | 0.9228571428571429 |
# | d               | 1.5    | 4     | 0.08823529411764706 | 0.9066666666666666 |
# +-----------------+--------+-------+---------------------+--------------------+
# | Iteration Count |                                                        50 |
# +-----------------+--------+-------+---------------------+--------------------+
# | Sum Ratio       |                                       0.02231601731601729 |
# +-----------------+--------+-------+---------------------+--------------------+
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/aoozdemir/seel. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Seel project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/aoozdemir/seel/blob/master/CODE_OF_CONDUCT.md).
