# frozen_string_literal: true

class Roda
  module RodaPlugins
    # The phlex plugin allows match blocks to return Phlex::HTML
    # objects, which are automatically rendered and used as the
    # response body.
    #
    # Without the plugin:
    #
    #   r.is "play" do
    #     View::Layout::Main.new(
    #       title: "Play",
    #       body: View::Play
    #     ).call
    #   end
    #
    # With the plugin:
    #
    #   plugin :phlex
    #
    #   r.is "play" do
    #     View::Layout::Main.new(
    #       title: "Play",
    #       body: View::Play
    #     )
    #   end
    #
    # By default, Phlex::HTML objects are rendered using #call and
    # the response Content-Type is set to text/html; charset=utf-8.
    module Phlex
      def self.load_dependencies(app, opts = OPTS)
        app.plugin :custom_block_results
      end

      def self.configure(app, opts = OPTS)
        app.opts[:phlex_result_content_type] =
          opts[:content_type] || "text/html; charset=utf-8"

        app.opts[:custom_block_results][::Phlex::HTML] =
          :handle_phlex_block_result
      end

      module ClassMethods
        def phlex_result_classes
          opts[:phlex_result_classes]
        end
      end

      module InstanceMethods
        def handle_phlex_block_result(result)
          @_response[RodaResponseHeaders::CONTENT_TYPE] ||=
            opts[:phlex_result_content_type]

          result.call
        end
      end
    end

    register_plugin(:phlex_render, Phlex)
  end
end
