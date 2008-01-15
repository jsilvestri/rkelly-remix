module RKelly
  module JS
    class GlobalObject < Base
      def initialize
        super
        self['class']     = 'GlobalObject'
        self['NaN']       = JS::NaN.new
        self['NaN'].attributes << :dont_enum
        self['NaN'].attributes << :dont_delete

        self['Infinity']  = 1.0/0.0
        self['Infinity'].attributes << :dont_enum
        self['Infinity'].attributes << :dont_delete

        self['undefined'] = :undefined
        self['undefined'].attributes << :dont_enum
        self['undefined'].attributes << :dont_delete

        self['Object'] = JS::Object.new
        self['Object'].function = lambda { |*args|
          JS::Object.create(*args)
        }
        self['Number'] = JS::Number.new
        self['Boolean'] = JS::Boolean.new
        self['Boolean'].function = lambda { |*args|
          JS::Boolean.create(*args)
        }
      end
    end
  end
end
