#
# Solution
#
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





#
# Sample Tests
#
class Foo(object, metaclass = Meta):
    def __init__(self, x):
        self.x = x

    def bar(self, v):
        return (self.x, v)

a = Foo(1)
a.bar(2)

calls = Debugger.method_calls

test.assert_equals(len(calls), 2)

test.describe("Test collected method calls")

test.it("Call to init should be collected")
test.assert_equals(calls[0]['args'], (a, 1))

test.it("Call to bar should be collected")
test.assert_equals(calls[1]['args'], (a, 2))

test.describe("Test collected attribute accesses")
accesses = Debugger.attribute_accesses

test.assert_equals(len(accesses), 3)

test.it("Attribute set in init should be collected")
test.assert_equals(accesses[0]['action'], 'set')
test.assert_equals(accesses[0]['attribute'], 'x')
test.assert_equals(accesses[0]['value'], 1)

test.it("Method get should be collected too")
test.assert_equals(accesses[1]['action'], 'get')
test.assert_equals(accesses[1]['attribute'], 'bar')

test.it("Attribute get should be collected")
test.assert_equals(accesses[2]['action'], 'get')
test.assert_equals(accesses[2]['attribute'], 'x')