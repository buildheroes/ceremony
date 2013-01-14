# Ceremony

ceremony is a rails engine to award achievments to whatever because of whatever :-)

## What?

ceremony brings you a dsl to easily define achievments for your whole app. It also brings you a interface to trigger the process of awarding the achievments to your subjects. These subjects can be anything you want. The achievments are stored in a datastore, currenly it will be redis, but you can easily add your own adapter and persist the awards wherever you want.

## The DSL

Here is a simple example

    Ceremony::Achievments.define do

      multi_level :comments do
        desc "How active are you commenting"

        condition do |subject|
          subject.comments.count >= threshold
        end

        define :Greenhorn,      threshold: 1
        define :Nice,           threshold: 10
        define "Shut up",       threshold: 1000

      end

      one_off :started_to_write do
        desc "Started first own topic"
        condition { |subject| subject.posts.count > 0 }
      end

    end

As you can see there are two types of achievments, multi-level and one-offs. A one-off achievments gets will never be taken away from the subject once it has been awarded. In a multi-level achievment you can reach different levels. You will only be in one level at a time and usually you will never be degraded but just rise up. For every achievment you can define the condition in a block which has to be met to award the achievment to a subject.

To start the award ceremony you just have to call

    Ceremony::Achievments.award(subject)

or you can pass in several subjects at once

    Ceremony::Achievments.award([subject_1, subject_2, subject_3])

after this call, your subjects will have all the awards they deserve.

You can get all achievments of a subject by calling

    Ceremony::Achievments.for(subject)

## Views

I also added some view helpers to render the achievments(<code>include Ceremony::ViewHelpers</code> in <code>ApplicationHelper</code>). If you want to render all achievments of a subject you can call

    <%= render_achievments_for subject %>

or if you want to render just one achievment

    <%= render_achievment achievment %>

If you want to show a gallery of all you available achievments you can do something like

    <%- Ceremony::Achievments.all.each do |achievment| -%>

      <%= render_achievment achievment %>

    <%- end -%>

As I can imagine that you want to render your achievments your own way i mainly added the view helpers so you can take a look at them to modify them to your needs.

## Disclaimer

Actually nothing of this Readme works already. I am just following the great aproach of Tom Presto-Werner: [Readme Driven Development](http://tom.preston-werner.com/2010/08/23/readme-driven-development.html)

## License

Copyright 2013 Andi Bade

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
