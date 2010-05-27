require 'rbconfig'
module Rserve
  class REXP
    class Double < REXP::Vector
      attr_reader :payload
      # NA is arch dependent
      case Config::CONFIG['arch']
      when 'i686-linux'
        NA = 269653970229425383598692395468593241088322026492507901905402939417320933254485890939796955099302180188971623023005661539310855695935759376615857567599472873400528811349204333736152257830107446553333670133666606746438802800063353690283455789426038632208916715592554825644961573453826957827246636338344317943808
      else
        NA = 0x100000000007a2000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
      end

      def initialize(data, attrs=nil)
        @payload=case data
      when Numeric
        [data.to_f]
      when Array
        data
      else
        raise ArgumentError, "Should be Numeric or Array"
      end
      super(attrs)
    end
    def length
      payload.length
    end
    def integer?
      true
    end
    def numeric?
      true
    end
    def as_integers
      @payload.map(&:to_i)
    end
    def as_doubles
      @payload.map(&:to_f)
    end
    def as_strings
      @payload.map {|v| v.to_f.to_s}
    end

    def na?(value=nil)
      return value == NA unless value.nil?
      @payload.map {|v| v==NA}
    end
    def to_debug_string
      t=super
      t << "{"  << @payload.map(&:to_s).join(",") << "}"
    end
  end
end
end
