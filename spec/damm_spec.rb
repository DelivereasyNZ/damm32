# frozen_string_literal: true

require "rspec"

require_relative "../lib/damm32"
require_relative "../lib/damm32/version"

RSpec.describe Damm32 do
  it "has a version number" do
    expect(Damm32::VERSION).not_to be nil
  end

  describe "#checksum_ord" do
    context "when supplied an array of in-range integers" do
      it "computes a damm32 checksum" do
        expect(Damm32.checksum_ord([1, 2, 3])).to eq(5)
      end
    end
  end

  describe "#checksum" do
    context "when supplied a string of in-range characters" do
      it "computes a damm32 checksum" do
        expect(Damm32.checksum("bcd")).to eq("f")
      end
    end
  end

  describe "#add_checksum" do
    it "adds a damm32 checksum to the end" do
      expect(Damm32.add_checksum("bcd")).to eq("bcdf")
    end
  end

  describe "#valid?" do
    context "with the correct checksum as the final character" do
      it "returns true" do
        expect(Damm32.valid?("bcdf")).to be_truthy
      end
    end

    context "with the checksum left off or wrong" do
      it "returns false" do
        expect(Damm32.valid?("bcd")).to be_falsey
        expect(Damm32.valid?("bcda")).to be_falsey
      end
    end
  end

  describe "#to_b32_ord" do
    context "when given an in-range char" do
      it "returns the relevant ord" do
        expect(Damm32.to_b32_ord("a")).to eq(0)
        expect(Damm32.to_b32_ord("f")).to eq(5)
        expect(Damm32.to_b32_ord("7")).to eq(31)
      end
    end

    context "with an out-of-range ord" do
      it "raises exceptions" do
        expect { Damm32.to_b32_ord("za") }.to raise_error(Damm32::UnknownAlphabet)
        expect { Damm32.to_b32_ord("0") }.to raise_error(Damm32::UnknownAlphabet)
        expect { Damm32.to_b32_ord("1") }.to raise_error(Damm32::UnknownAlphabet)
        expect { Damm32.to_b32_ord("ö") }.to raise_error(Damm32::UnknownAlphabet)
      end
    end
  end

  describe "#from_b32_ord" do
    context "when given a in-range ord" do
      it "returns the relevant character" do
        expect(Damm32.from_b32_ord(0)).to eq("a")
        expect(Damm32.from_b32_ord(5)).to eq("f")
        expect(Damm32.from_b32_ord(31)).to eq("7")
      end
    end

    context "with out of range ords" do
      it "raises exceptions" do
        expect { Damm32.from_b32_ord(-1) }.to raise_error(Damm32::OutOfRange)
        expect { Damm32.from_b32_ord(32) }.to raise_error(Damm32::OutOfRange)
        expect { Damm32.from_b32_ord(50) }.to raise_error(Damm32::OutOfRange)
      end
    end
  end
end
