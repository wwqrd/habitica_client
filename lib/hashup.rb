module Hashup

  def hashup(*attributes)
    define_method(:to_h) do

      kv = attributes.map { |k| [k, send(k)] }
           .delete_if { |_k, v| v.nil? }

      Hash[kv]

    end
  end

end
