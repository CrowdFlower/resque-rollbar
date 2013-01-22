describe Resque::Failure::Ratchetio do
  it "notifies" do
    exception = StandardError.new("BOOM")
    worker = Resque::Worker.new(:test)
    queue = "test"
    payload = {'class' => Object, 'args' => 66}

    ::Ratchetio = mock("ratchetio")
    ::Ratchetio.should_receive(:report_exception).with(exception, payload)

    backend = Resque::Failure::Ratchetio.new(exception, worker, queue, payload)
    backend.save
  end
end
