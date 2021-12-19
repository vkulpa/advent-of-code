def assert_equal(message, actual, expected)
  unless actual.eql?(expected)
    $test_failed = true
    puts "#{message}. Expected #{expected} to be equal #{actual}"
  end
end

def assert_risen(exception = RuntimeError)
  begin
    yield
    $test_failed = true
  rescue exception
    # Ignored
  end
end

def failed?
  $test_failed
end