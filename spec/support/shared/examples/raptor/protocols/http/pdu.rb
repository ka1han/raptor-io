shared_examples_for 'Raptor::Protocol::HTTP::PDU' do

  let(:url) { 'http://test.com' }

  describe '#initialize' do
    context 'when no :url option has been provided' do
      it 'raises ArgumentError' do
        raised = false
        begin
          described_class.new
        rescue ArgumentError
          raised = true
        end
        raised.should be_true
      end
    end
  end

  describe '#url' do
    it 'returns the configured value' do
      described_class.new( url: url ).url.should == url
    end
  end

  describe '#parsed_url' do
    it 'returns the configured URL as a parsed object' do
      described_class.new( url: url ).parsed_url.should == URI(url)
    end
  end

  describe '#headers' do
    context 'when not configured' do
      it 'defaults to an empty Hash' do
        described_class.new( url: url ).headers.should == {}
      end
    end

    it 'returns the configured value' do
      headers = { 'Content-Type' => 'text/plain' }
      described_class.new( url: url, headers: headers ).headers.should == headers
    end
  end

  describe '#body' do
    it 'returns the configured body' do
      body = 'Stuff...'
      described_class.new( url: url, body: body ).body.should == body
    end
  end
end
