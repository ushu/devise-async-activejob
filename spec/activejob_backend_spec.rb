require 'spec_helper'

AJ = Devise::Async::Backend::ActiveJob

describe "Activejob" do
  let(:user) { User.create }
  let(:args) { [ 'perform', 'User', user.id, 'test', 'me' ] }

  describe ".enqueue" do

    it "calls .perform_later on the runner class" do
      if AJ::Runner.method_defined?(:perform_later)
        expect(::ActiveJob::Base).to receive(:perform_later).with(*args)
      else
        expect(::ActiveJob::Base).to receive(:enqueue).with(*args)
      end
      AJ.enqueue(*args)
    end

  end # .enqueue

  describe "Async worker" do

    it "instanciates the ActiveJob backend class" do
      expect(AJ).to receive(:new).and_return(double.as_null_object)
      AJ.enqueue(*args)
    end

    context "once the backend class has been instanciated" do
      let(:backend) { double }
      before { allow(AJ).to receive(:new).and_return(backend) }

      # this one tests the whole process
      it "calls #perform on the ActiveJob backend instance" do
        expect(backend).to receive(:perform).with(*args)
        AJ.enqueue(*args)
      end

    end

  end # Async worker

end
