
describe("Foo test", function()
  it("basic test", function()
    assert.is_false(false)
  end)

  it("assert_true test", function()
    local foo = require "foo"
    assert(type(foo.test_true) == 'function')
    assert.is_true(foo.test_true())
  end)

  it("assert_false test", function()
    local foo = require "foo"
    assert(type(foo.test_false) == 'function')
    assert.is_false(foo.test_false())
  end)
end)
