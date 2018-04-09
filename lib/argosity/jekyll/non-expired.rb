module Argosity
    module Jekyll
        module NonExpiredFilter
            def non_expired(events)
                cutoff = Date.today
                events.select do | event |
                    expires = event.data['expires'] || event.data['dates']
                    begin
                        expires = Utils.parse_date(expires) if expires.is_a?(String)
                        expires.to_date > cutoff
                    rescue
                        true
                    end
                end
            end
        end
    end
end

Liquid::Template.register_filter(Argosity::Jekyll::NonExpiredFilter)
