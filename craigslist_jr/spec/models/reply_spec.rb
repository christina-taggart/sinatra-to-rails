require 'spec_helper'

describe Reply do
  it { should belong_to :post }
  it { should validate_presence_of :name }
  it { should validate_presence_of :email }
  it { should validate_presence_of :text }
  it { should respond_to :created_at }

  context 'email validation' do
    let(:valid_email) { "happy@bear.com" }
    let(:invalid_email) { "b@@@.com" }

    subject(:new_reply) { Reply.new(name: 'kevin', text: 'ill fix yo bike fresh') }
    it 'should accept a valid email format' do
      new_reply.email = valid_email
      expect(new_reply).to be_valid
    end

    it 'reply with bad email will be invalid' do
      new_reply.email = invalid_email
      expect(new_reply).not_to be_valid
    end
  end
end