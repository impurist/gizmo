require 'spec_helper'

describe "Gizmo" do
  describe "Helpers" do

    let(:body){
      <<-eos
        <html>
          <head>
            <title>my awesome web page</title>
          </head>
          <body>
            <p class="one_of_these">paragraph one</p>
            <p class="two_of_these">paragraph two</p>
            <p class="two_of_these">paragraph three</p>
          </body>
        </html>
      eos
    }

    let(:current_url) { 'http://example.com' }

    it "should provide a method :on_page" do
      expect(respond_to?(:on_page)).to eq(true)
    end

    it "should provide a method :on_page_with" do
      expect(respond_to?(:on_page_with)).to eq(true)
    end

    describe "#on_page" do

      it "should raise an error if no block given" do
        expect { on_page }.to raise_error(Gizmo::NoBlockGivenError)
      end

      it "should not raise an error if given a block" do
        expect { on_page { |page| page } }.to_not raise_error
      end

      it "should yield a page object" do
        on_page { |page| expect(page).to be_a Gizmo::PageObject }
      end

      it "should raise an error if the response object is nil" do
        allow(self).to receive(:body) { nil }
        expect { on_page { |page| page } }.to raise_error(Gizmo::NilResponseError, "Doh! response object is nil. This generally means your scenario has not yet visited a page!")
      end

    end


    describe "#on_page_with" do


      it "should raise an error if one or more module_names are given" do
        expect { on_page_with }.to raise_error(ArgumentError, "You must supply at least one mixin")
      end

      it "should raise an ArgumentError if module_name is not a symbol" do
        expect { on_page_with 'my_module_name' }.to raise_error(ArgumentError, "module_name must be a symbol")
      end

      it "should not raise an error if module_name is a symbol" do
        expect { on_page_with :my_mixin }.to_not raise_error
      end

      it "should not raise ArgumentError if multiple module_names are given" do
        expect { on_page_with :my_mixin, :my_other_mixin }.to_not raise_error
      end

      it "should raise Gizmo::MixinNotValidError if the mixin is not valid" do
        expect { on_page_with :my_invalid_mixin }.to raise_error(Gizmo::MixinNotValidError)
      end

      it "should raise Gizmo::MixinNotFoundError if the mixin file cannot be loaded from the mixin_path" do
        expect { on_page_with :my_non_existent_mixin }.to raise_error(Gizmo::MixinNotFoundError)
      end

      it "should yield a page object to a block if supplied" do
        on_page_with(:my_mixin) { |page| expect(page).to_not be_nil }
      end

      it "should yield a page object to a block" do
        on_page_with(:my_mixin) { |page| expect(page).to be_a Gizmo::PageObject }
      end

      it "should return a page object which has been extended to include the mixin functionality" do
        on_page_with(:my_mixin) do |page|
          expect(page).to respond_to :my_method
        end
      end

    end
  end
end
