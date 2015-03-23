local tsc = require "telescope"

context("Foo test", function()
  test("basic test", function()
    assert_false(false)
  end)

  test("export functions", function()
    local foo = require "foo"
    assert_function(foo.test_true)
    assert_true(foo.test_true())
  end)

  test("foo module", function()
    local foo = require "foo"
    assert_function(foo.test_false)
    assert_false(foo.test_false())
  end)
end)

