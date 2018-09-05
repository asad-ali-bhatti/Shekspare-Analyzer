require_relative 'spec_helper'
require 'pry'

describe MacbethAnalyzer do

  let(:speaker_1) { "ALL" }
  let(:speaker_2) { "JON" }
  let(:play_raw_xml) do
    "<PLAY><SPEECH>
       <SPEAKER>#{speaker_1}</SPEAKER>
       <LINE>Line1</LINE>
       <LINE>Line2</LINE>
       </SPEECH>
       <SPEECH>
       <SPEAKER>#{speaker_2}</SPEAKER>
       <LINE>Line1</LINE>
       <LINE>Line2</LINE>
       <LINE>Line3</LINE>
       </SPEECH></PLAY>"
  end

  before(:each) do
    allow_any_instance_of(MacbethAnalyzer).to receive(:open).and_return(play_raw_xml)
  end

  subject {  MacbethAnalyzer.new('') }

  describe 'Attributes' do
    it { should respond_to :play_xml }
    it { should respond_to :ignored_speakers }
    it { should respond_to :result }

    it 'should include ALL in ignored_speakers' do
      expect(subject.ignored_speakers).to be_include('ALL')
    end
  end

  describe '#run' do

    before(:each) do
      subject.run
    end

    it 'should ignore ALL dialogs' do
      expect(subject.result[speaker_1]).to be_nil
    end

    it 'should count JON dialogs' do
      expect(subject.result[speaker_2]).to eq(3)
    end
  end

  describe '#show_result' do
    let(:output){ StringIO.new }
    before { subject.run }
    it "should print result like '[lines count] [speaker]\n'" do
      subject.show_result(output)
      expect(output.string).to include("3 JON\n")
    end
  end
end

