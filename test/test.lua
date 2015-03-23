local tsc = require "telescope"

context("Foo test", function()
  test("basic test", function()
    assert_false(false)
  end)

  test("assert_true test", function()
    local foo = require "foo"
    assert_type(foo.test_true, 'function')
    assert_true(foo.test_true())
  end)

  test("assert_false test", function()
    local foo = require "foo"
    assert_type(foo.test_false, 'function')
    assert_false(foo.test_false())
  end)
end)
