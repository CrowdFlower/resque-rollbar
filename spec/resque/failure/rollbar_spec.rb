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

  class CustomError < StandardError
    attr_accessor :notifier_params
  end

  it "if exception responds to notification_params it will pass it along with the payload" do
    exception = CustomError.new("BOOM")
    exception.notifier_params = {'custom' => 'info'}
    worker = Resque::Worker.new(:test)
    queue = "test"
    payload = {'class' => Object, 'args' => 66}
    merged_payload = {'class' => Object, 'args' => 66, 'custom' => 'info'}

    ::Rollbar = mock("rollbar")
    ::Rollbar.should_receive(:report_exception).with(exception, merged_payload)

    backend = Resque::Failure::Rollbar.new(exception, worker, queue, payload)
    backend.save
  end
end
