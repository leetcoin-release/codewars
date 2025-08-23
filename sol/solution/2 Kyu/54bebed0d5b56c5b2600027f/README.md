# [**Debugger**](https://www.codewars.com/kata/54bebed0d5b56c5b2600027f)

## **Description**:

Imagine you have a large project where is suddenly going something very messy. You are not able to guess what it is and don't want to debug all the code through. Your project has one base class.

In this kata you will write metaclass Meta for your base class, which will collect data about all attribute accesses and method calls in all project classes. From this data you can then better guess what is happening or which method call is bottleneck of your app.

We will use class Debugger to store the data. Method call collection should look like this:

```md
Debugger.method_calls.append({
    'class': ..., # class object, not string
    'method': ..., # method name, string
    'args': args, # all args, including self
    'kwargs': kwargs
})
```

Attribute access collection should look like this:

```md
Debugger.attribute_accesses.append({
    'action': 'set', # set/get
    'class': ..., # class object, not string
    'attribute': ..., # name of attribute, string
    'value': value # actual value
})
```

You should NOT log calls of getter/setter methods that you might create by meta class.

See the tests if in doubts.

## **Solutions:**

#### **Python**
```py
class Debugger(object):
    attribute_accesses = []
    method_calls = []
class Meta(type):
    def __new__(mcs, name, bases, namespace):
        cls = super().__new__(mcs, name, bases, namespace)
        for attr, value in namespace.items():
            if callable(value):  
                def make_wrapper(method_name, method):
                    def wrapper(*args, **kwargs):
                        Debugger.method_calls.append({
                            'class': cls,
                            'method': method_name,
                            'args': args,
                            'kwargs': kwargs
                        })
                        return method(*args, **kwargs)
                    return wrapper
                setattr(cls, attr, make_wrapper(attr, value))
        def logged_getattribute(self, item):
            if not item.startswith('__'):
                value = object.__getattribute__(self, item)
                Debugger.attribute_accesses.append({
                    'action': 'get',
                    'class': type(self),
                    'attribute': item,
                    'value': value
                })
                return value
            return object.__getattribute__(self, item)
        def logged_setattr(self, key, value):
            if not key.startswith('__'):
                Debugger.attribute_accesses.append({
                    'action': 'set',
                    'class': type(self),
                    'attribute': key,
                    'value': value
                })
            object.__setattr__(self, key, value)
        cls.__getattribute__ = logged_getattribute
        cls.__setattr__ = logged_setattr
        return cls
```