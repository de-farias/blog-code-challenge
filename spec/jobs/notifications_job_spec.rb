RSpec.describe NotificationsJob, type: :job do
  include ActiveJob::TestHelper

  after do
    clear_enqueued_jobs
    clear_performed_jobs
  end

  let(:post) { create(:post) }
  let(:user) { create(:user) }
  let(:job)  { described_class.perform_later('PostCreated', post, user.id) }

  it 'queues the job' do
    expect { job }.to(
      change(ActiveJob::Base.queue_adapter.enqueued_jobs, :size).by(1)
    )
  end

  it 'is in notifications queue' do
    expect(NotificationsJob.new.queue_name).to eq('notifications')
  end

  it 'results in the creation of a Notification' do
    expect { perform_enqueued_jobs { job } }.to(
      change { Notification.count }.by(1)
    )
  end
end
