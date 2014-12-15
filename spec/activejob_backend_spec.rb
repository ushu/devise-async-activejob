$:<< File.expand_path('../../lib', __FILE__)

# dependencies
require 'rails'
require 'global_id'
require 'devise'
require 'devise-async'
require 'active_job/base'

# gem
require 'devise/async/backend/active_job'

# test framework
require 'rspec'

AJ = Devise::Async::Backend::ActiveJob
describe "Activejob" do

  describe ".enqueue" do

    it "calls .perform_later on the runner class" do
      expect(::ActiveJob::Base).to receive(:perform_later).with('test', 'me')
      AJ.enqueue('test', 'me')
    end

  end # .enqueue

  describe "Async worker" do

    it "instanciates the ActiveJob backend class" do
      expect(AJ).to receive(:new).and_return(double.as_null_object)
      AJ.enqueue('test', 'me')
    end

    context "once the backend class has been instanciated" do
      let(:backend) { double }
      before { allow(AJ).to receive(:new).and_return(backend) }

      # this one tests the whole process
      it "calls #perform on the ActiveJob backend instance" do
        expect(backend).to receive(:perform).with('test', 'me')
        AJ.enqueue('test', 'me')
      end

    end

  end # Async worker

end
