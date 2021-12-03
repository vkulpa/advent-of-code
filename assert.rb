def assert_equal(message, actual, expected)
  unless actual.eql?(expected)
    $test_failed = true
    puts "#{message}. Expected #{expected} to be equal #{actual}"
  end
end

def failed?
  $test_failed
end