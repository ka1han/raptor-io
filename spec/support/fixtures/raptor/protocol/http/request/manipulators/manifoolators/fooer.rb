module Raptor
module Protocol::HTTP
class Request

module Manipulators
module Manifoolators

#
# Test manipulator, shows that manipulators can be namespaced.
#
# @author Tasos Laskos <tasos_laskos@rapid7.com>
#
class Fooer < Manipulators::Base

  def run
    request.url += ('foo' * options[:times])
  end

end

end
end
end
end
end
