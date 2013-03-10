describe Resque::Failure::Rollbar do
  it "notifies" do
    exception = StandardError.new("BOOM")
    worker = Resque::Worker.new(:test)
    queue = "test"
    payload = {'class' => Object, 'args' => 66}

    ::Rollbar = mock("rollbar")
    ::Rollbar.should_receive(:report_exception).with(exception, payload)

    backend = Resque::Failure::Rollbar.new(exception, worker, queue, payload)
    backend.save
  end
end
