# SourceCode

Adds a ```source_code``` method to Method.  This will allow you to view the source code of any Ruby method.

So let's say you have a method in a class like this:

```ruby
class FancyClass

  def do_something
    1 + 1
  end

end
```

You've always been able to get a pointer to the method's source code like this:

```ruby
FancyClass.new.method(:do_something).source_location
# ['fancy_class.rb', 3]
```

This gem adds ```.source_code```, so you can see the source like this:

```ruby
puts FancyClass.new.method(:do_something).source_code
#  def do_something
#    1 + 1
#  end
```
