TEST_CMD = "bundle exec spring rails test --color"

@last_test = nil

def run_tests(test, force=false)
  test = @last_test unless File.exist?(test) or force or not @last_test
  if force || File.exist?(test)
    @last_test = test
    puts "-" * 80
    test_cmd = "#{TEST_CMD} #{test}"
    puts test
    cmd = IO.popen("#{test_cmd} 2>&1")
    $stdout.write(cmd.getc) until cmd.eof?
  else
    puts "#{test} does not exist."
  end
end

def run_suite
  run_tests('test', :force)
end

watch('^test/.*_test\.rb'   ) { |m| run_tests(m.to_s) }
watch('^app/(.*)\.rb'       ) { |m| run_tests("test/#{m[1]}_test.rb") }
watch('^lib/(.*)\.(rb|rake)') { |m| run_tests("test/lib/#{m[1]}_test.rb") }

Signal.trap('QUIT') { run_suite } # Ctrl-\
