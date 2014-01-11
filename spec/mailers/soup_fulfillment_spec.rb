require "spec_helper"

describe SoupFulfillment do
  describe "match" do
    let(:mail) { SoupFulfillment.match }

    it "renders the headers" do
      mail.subject.should eq("Match")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
